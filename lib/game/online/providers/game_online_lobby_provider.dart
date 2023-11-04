import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/models/game_online_socket_model.dart';

final gameOnlineLobbyProvider = StateNotifierProvider.autoDispose<GameOnlineLobbyProvider, List<GameOnlineSocketModel>>(
      (ref) => GameOnlineLobbyProvider(),
);

class GameOnlineLobbyProvider extends StateNotifier<List<GameOnlineSocketModel>> {

  static final List<GameOnlineSocketModel> _initialState = [];

  GameOnlineLobbyProvider(): super(_initialState);

  void addSocket(String socketId) {

    final GameOnlineSocketModel gameOnlineSocketModel = GameOnlineSocketModel(
      socketId: socketId,
    );

    if (!state.contains(gameOnlineSocketModel)) {
      state = [
        ...state,
        gameOnlineSocketModel,
      ];
    }

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

  void removeSocket(GameOnlineSocketModel gameOnlineSocketModel) {
    if (state.contains(gameOnlineSocketModel)) {
      final List<GameOnlineSocketModel> newState = [...state];
      newState.remove(gameOnlineSocketModel);
      state = [...newState];
    }
  }

}