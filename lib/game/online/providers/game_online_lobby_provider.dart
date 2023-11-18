import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/models/game_online_socket_model.dart';

final gameOnlineLobbyProvider = StateNotifierProvider.autoDispose<GameOnlineLobbyNotifier, List<GameOnlineSocketModel>>(
      (ref) => GameOnlineLobbyNotifier(),
);

class GameOnlineLobbyNotifier extends StateNotifier<List<GameOnlineSocketModel>> {

  @override
  void dispose() {
    state = [];
    super.dispose();
  }

  // Initial state of the Provider
  static final List<GameOnlineSocketModel> _initialState = [];

  // Constructor of the provider
  GameOnlineLobbyNotifier(): super(_initialState);

  // Function to check if the current state contains a given socket's id
  bool _doesStateContainsSocketId(String socketId) {
    for (GameOnlineSocketModel gameOnlineSocketModel in state) {
      if (gameOnlineSocketModel.socketId == socketId) {
        return true;
      }
    }
    return false;
  }

  // Function to get the position inside the state's array of a given socket's id inside the current state
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

  // Function to remove a socket using an id
  void removeSocketFromList(String socketId, { bool notify = true }) {
    if (_doesStateContainsSocketId(socketId)) {

      // Get the position of the socket id inside the state's list
      final int positionOfSocketInState = _getPositionOfSocketIdInState(socketId);

      if (notify) {

        final List<GameOnlineSocketModel> newState = [ ...state ];
        newState.removeAt(positionOfSocketInState);

        state = [ ...newState ];

        return;
      }

      state.removeAt(positionOfSocketInState);

    }
  }

  void resetReadyStatus(){

    final List<GameOnlineSocketModel> newState = [];
    for (GameOnlineSocketModel gameOnlineSocketModel in state) {
      gameOnlineSocketModel.readyStatus = false;
      newState.add(gameOnlineSocketModel);
    }

    state = newState;
  }

  // Function to set a given list containing sockets' ids as the current state
  void setSocketsList(List<String> socketsIdsList, {bool notify = true}) {

    // Clear the state for not having multiple
    // entries with the same ids
    state.clear();

    final List<GameOnlineSocketModel> newState = [];

    for (String socketId in socketsIdsList) {

      // Check if the current state already contains this socket id
      if (_doesStateContainsSocketId(socketId)) {

        // If so, to ensure that the state of this socket is maintained,
        // a deep copy is done using .fromJson and .toJson to recreate an object with the same properties
        final int positionOfSocketInState = _getPositionOfSocketIdInState(socketId);

        if (notify) {
          newState.add(GameOnlineSocketModel.fromJson(state[positionOfSocketInState].toJson()));
        } else {
          state.add(GameOnlineSocketModel.fromJson(state[positionOfSocketInState].toJson()));
        }

      } else {

        // If not, create a new object and add to the new state
        if (notify) {
          newState.add(
            GameOnlineSocketModel(
              socketId: socketId,
            ),
          );
        } else {
          state.add(
            GameOnlineSocketModel(
              socketId: socketId,
            ),
          );
        }

      }
    }

    if (notify) {
      state = [...newState];
    }

  }

  // Function to change the ready status of a given socket's id
  void changeReadyStatus(String socketId) {

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