import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/models/lobby/game_online_lobby_model.dart';
import 'package:tapit/game/online/models/socket/game_online_socket_model.dart';

final gameOnlineLobbyProvider = StateNotifierProvider.autoDispose<GameOnlineLobbyNotifier, GameOnlineLobbyModel>(
      (ref) => GameOnlineLobbyNotifier(),
);

class GameOnlineLobbyNotifier extends StateNotifier<GameOnlineLobbyModel> {

  // Initial state of the Provider
  static final GameOnlineLobbyModel _initialState = GameOnlineLobbyModel(
    lobbyId: "",
    sockets: [],
  );

  // Constructor of the provider
  GameOnlineLobbyNotifier(): super(_initialState);

  // Function to check if the current state contains a given socket's id
  bool _doesStateContainsSocketId(String socketId) {
    for (GameOnlineSocketModel gameOnlineSocketModel in state.sockets) {
      if (gameOnlineSocketModel.socketId == socketId) {
        return true;
      }
    }
    return false;
  }

  // Function to get the number of connected socket to the lobby
  int getNumberOfConnectedSockets() {
    return state.sockets.length;
  }

  // Function to get the position inside the state's array of a given socket's id inside the current state
  int _getPositionOfSocketIdInState(String socketId) {
    int i = 0;
    for (GameOnlineSocketModel gameOnlineSocketModel in state.sockets) {
      if (gameOnlineSocketModel.socketId == socketId) {
        return i;
      }
      i++;
    }
    return -1;
  }

  // Function to set a new state silently
  void setStateSilent(GameOnlineLobbyModel gameOnlineLobbyModel) {

    state.lobbyId = gameOnlineLobbyModel.lobbyId;
    state.sockets = gameOnlineLobbyModel.sockets;

  }

  // Function to get the socket model from the socket id
  GameOnlineSocketModel? getSocket(String? socketId) {

    if (socketId == null) {
      return null;
    }

    final int position = _getPositionOfSocketIdInState(socketId);

    if (position == -1) {
      return null;
    }

    return state.sockets[position];
  }

  // Function to remove a socket using an id
  void removeSocketFromList(String socketId, { bool notify = true }) {
    if (_doesStateContainsSocketId(socketId)) {

      // Get the position of the socket id inside the state's list
      final int positionOfSocketInState = _getPositionOfSocketIdInState(socketId);

      if (notify) {

        final List<GameOnlineSocketModel> newSocketsList = [ ...state.sockets ];
        newSocketsList.removeAt(positionOfSocketInState);

        final GameOnlineLobbyModel newState = GameOnlineLobbyModel(
          lobbyId: state.lobbyId,
          sockets: newSocketsList,
        );

        state = newState;

        return;
      }

      state.sockets.removeAt(positionOfSocketInState);

    }
  }

  // Function to get if all the sockets are ready
  bool areAllPlayersReady() {

    for (GameOnlineSocketModel gameOnlineSocketModel in state.sockets) {
      if (!gameOnlineSocketModel.readyStatus) {
        return false;
      }
    }

    return true;
  }

  // Function to reset all the ready status of the sockets
  void resetReadyStatus(){

    final List<GameOnlineSocketModel> newSocketsList = [];
    for (GameOnlineSocketModel gameOnlineSocketModel in state.sockets) {
      gameOnlineSocketModel.readyStatus = false;
      newSocketsList.add(gameOnlineSocketModel);
    }

    final GameOnlineLobbyModel newState = GameOnlineLobbyModel(
      lobbyId: state.lobbyId,
      sockets: newSocketsList,
    );

    state = newState;
  }

  // Function to set the lobby id of the provider silently
  void setLobbyIdSilent(String lobbyId) {
    state.lobbyId = lobbyId;
  }

  // Function to set a given list containing sockets' ids as the current state
  void setSocketsList(List<GameOnlineSocketModel> socketsList, {bool notify = true}) {

    // Clear the state for not having multiple
    // entries with the same ids
    state.sockets.clear();

    final List<GameOnlineSocketModel> newSocketsList = [];

    for (GameOnlineSocketModel gameOnlineSocketModel in socketsList) {

      final String socketId = gameOnlineSocketModel.socketId;
      final bool isLeader = gameOnlineSocketModel.isLeader;
      final int order = gameOnlineSocketModel.order;

      // Check if the current state already contains this socket id
      if (_doesStateContainsSocketId(socketId)) {

        // If so, to ensure that the state of this socket is maintained,
        // a deep copy is done using .fromJson and .toJson to recreate an object with the same properties
        final int positionOfSocketInState = _getPositionOfSocketIdInState(socketId);

        if (notify) {
          newSocketsList.add(GameOnlineSocketModel.fromJson(state.sockets[positionOfSocketInState].toJson()));
        } else {
          state.sockets.add(GameOnlineSocketModel.fromJson(state.sockets[positionOfSocketInState].toJson()));
        }

      } else {

        // If not, create a new object and add to the new state
        if (notify) {
          newSocketsList.add(
            GameOnlineSocketModel(
              socketId: socketId,
              isLeader: isLeader,
              order: order,
            ),
          );
        } else {
          state.sockets.add(
            GameOnlineSocketModel(
              socketId: socketId,
              isLeader: isLeader,
              order: order,
            ),
          );
        }

      }
    }

    if (notify) {

      final GameOnlineLobbyModel newState = GameOnlineLobbyModel(
        lobbyId: state.lobbyId,
        sockets: newSocketsList,
      );

      state = newState;

    }

    // Sorting of the sockets list alphabetically from the ids
    // to have the same order in leader and guest
    state.sockets.sort((a, b) => a.order.compareTo(b.order));

  }

  // Function to change the ready status of a given socket's id
  void changeReadyStatus(String socketId) {

    final List<GameOnlineSocketModel> newSocketsList = [...state.sockets];

    for (GameOnlineSocketModel socketModel in newSocketsList) {
      if (socketModel.socketId == socketId) {
        socketModel.readyStatus = !socketModel.readyStatus;
        break;
      }
    }

    final GameOnlineLobbyModel newState = GameOnlineLobbyModel(
      lobbyId: state.lobbyId,
      sockets: newSocketsList,
    );

    state = newState;
  }

}