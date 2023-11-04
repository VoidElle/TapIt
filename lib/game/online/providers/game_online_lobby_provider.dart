import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/models/game_online_socket_model.dart';

final gameOnlineLobbyProvider = StateNotifierProvider.autoDispose<GameOnlineLobbyProvider, List<GameOnlineSocketModel>>(
      (ref) => GameOnlineLobbyProvider(),
);

class GameOnlineLobbyProvider extends StateNotifier<List<GameOnlineSocketModel>> {

  static final List<GameOnlineSocketModel> _initialState = [];

  GameOnlineLobbyProvider(): super(_initialState);

  bool _doesStateContainsSocketId(String socketId) {
    for (GameOnlineSocketModel gameOnlineSocketModel in state) {
      if (gameOnlineSocketModel.socketId == socketId) {
        return true;
      }
    }
    return false;
  }

  int _getPositionOfSocketIdInState(String socketId) {
    int i = 0;
    for (GameOnlineSocketModel gameOnlineSocketModel in state) {
      if (gameOnlineSocketModel.socketId == socketId) {
        return i;
      }
      i++;
    }
    return -1;
  }

  void setSocketsList(List<String> socketsIdsList) {

    final List<GameOnlineSocketModel> newState = [];

    for (String socketId in socketsIdsList) {
      if (_doesStateContainsSocketId(socketId)) {
        final int positionOfSocketInState = _getPositionOfSocketIdInState(socketId);
        newState.add(GameOnlineSocketModel.fromJson(state[positionOfSocketInState].toJson()));
      } else {
        newState.add(
          GameOnlineSocketModel(
            socketId: socketId,
          ),
        );
      }
    }

    state = [...newState];
  }

  void setReadyStatus(String socketId) {

    final List<GameOnlineSocketModel> newState = [...state];

    for (GameOnlineSocketModel socketModel in newState) {
      if (socketModel.socketId == socketId) {
        socketModel.readyStatus = !socketModel.readyStatus;
        break;
      }
    }

    state = [...newState];
  }

}