import 'package:socket_io_client/socket_io_client.dart' as socket_io;
import 'package:tapit/game/online/enums/socket_enums.dart';

/// EVERY FUNCTION / EVENT THAT IS LISTED IN THIS CLASS
/// CAN RESULT IN A SUCCESS RESPONSE OR A FAIL RESPONSE
/// BE CAREFUL USING THEM AND LISTEN FOR BOTH SUCCESS AND FAIL EVENT RESPONSE
class GameOnlineSocketEmitter {

  // ==============================
  //     START LOBBY SECTION
  // ==============================

  // Function used to create a lobby
  void emitCreateLobbyEvent({
    required socket_io.Socket socket,
  }) {
    socket.emit(GameOnlineSocketEvent.createLobbyRequest.text);
  }

  // Function used to make a player join a lobby
  void emitJoinLobbyEvent({
    required socket_io.Socket socket,
    required String lobbyId
  }) {
    socket.emit(GameOnlineSocketEvent.joinLobbyRequest.text, lobbyId);
  }

  // Function used to make a player quit a lobby
  void emitQuitLobbyEvent({
    required socket_io.Socket socket,
    required String lobbyId
  }) {
    socket.emit(GameOnlineSocketEvent.quitLobbyRequest.text, lobbyId);
  }

  // Function used to change a player's ready status
  void emitChangeReadyStatusEvent({
    required socket_io.Socket socket,
    required String lobbyId
  }) {
    socket.emit(GameOnlineSocketEvent.playerChangeReadyStatus.text, lobbyId);
  }

  // Function used to start a lobby,
  // making a lobby an actual game's match
  void emitStartLobbyEvent({
    required socket_io.Socket socket,
    required String lobbyId
  }) {
    socket.emit(GameOnlineSocketEvent.startLobbyRequest.text, lobbyId);
  }

  // ==============================
  //     END LOBBY SECTION
  // ==============================




  // ==============================
  //     START GAME SECTION
  // ==============================

  // Function used to score inside a game
  void emitGameScoreEvent({
    required socket_io.Socket socket,
    required String lobbyId,
  }) {
    socket.emit(GameOnlineSocketEvent.gameScoreRequest.text, lobbyId);
  }

  // Function used to end a game, because a
  // player has reached the 100% of the screen
  void emitGameWinEvent({
    required socket_io.Socket socket,
    required String lobbyId,
  }) {
    socket.emit(GameOnlineSocketEvent.gameWinRequest.text, lobbyId);
  }

  // ==============================
  //     END GAME SECTION
  // ==============================

}