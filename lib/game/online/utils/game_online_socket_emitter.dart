import 'package:socket_io_client/socket_io_client.dart' as socket_io;
import 'package:tapit/game/online/enums/socket_enums.dart';

class GameOnlineSocketEmitter {

  void emitCreateLobbyEvent({
    required socket_io.Socket socket
  }) {
    socket.emit(GameOnlineSocketEvent.createLobbyRequest.text);
  }

  void emitJoinLobbyEvent({
    required socket_io.Socket socket,
    required String lobbyId
  }) {
    socket.emit(GameOnlineSocketEvent.joinLobbyRequest.text, lobbyId);
  }

  void emitQuitLobbyEvent({
    required socket_io.Socket socket,
    required String lobbyId
  }) {
    socket.emit(GameOnlineSocketEvent.quitLobbyRequest.text, lobbyId);
  }

  void emitChangeReadyStatusEvent({
    required socket_io.Socket socket,
    required String lobbyId
  }) {
    socket.emit(GameOnlineSocketEvent.playerChangeReadyStatus.text, lobbyId);
  }

  void emitStartLobbyEvent({
    required socket_io.Socket socket,
    required String lobbyId
  }) {
    socket.emit(GameOnlineSocketEvent.startLobbyRequest.text, lobbyId);
  }

  void emitGameScoreEvent({
    required socket_io.Socket socket,
    required String lobbyId,
  }) {
    socket.emit(GameOnlineSocketEvent.gameScoreRequest.text, lobbyId);
  }

  void emitGameWinEvent({
    required socket_io.Socket socket,
    required String lobbyId,
  }) {
    socket.emit(GameOnlineSocketEvent.gameWinRequest.text, lobbyId);
  }

}