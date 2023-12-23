import 'package:socket_io_client/socket_io_client.dart' as socket_io;
import 'package:tapit/game/online/enums/socket_enums.dart';

class GameOnlineSocketEmitter {

  void emitCreateLobbyEvent(socket_io.Socket socket) {
    socket.emit(GameOnlineSocketEvent.createLobbyRequest.text);
  }

  void emitJoinLobbyEvent(socket_io.Socket socket, String lobbyId) {
    socket.emit(GameOnlineSocketEvent.joinLobbyRequest.text, lobbyId);
  }

  void emitQuitLobbyEvent(socket_io.Socket socket, String lobbyId) {
    socket.emit(GameOnlineSocketEvent.quitLobbyRequest.text, lobbyId);
  }

  void emitChangeReadyStatusEvent(socket_io.Socket socket, String lobbyId) {
    socket.emit(GameOnlineSocketEvent.playerChangeReadyStatus.text, lobbyId);
  }

  void emitStartLobbyEvent(socket_io.Socket socket, String lobbyId) {
    socket.emit(GameOnlineSocketEvent.startLobbyRequest.text, lobbyId);
  }

}