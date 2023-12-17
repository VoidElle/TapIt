import 'package:socket_io_client/socket_io_client.dart' as socket_io;
import 'package:tapit/game/online/enums/socket_enums.dart';

class GameOnlineSocketEmitter {

  void emitCreateLobbyEvent() {

  }

  void emitJoinLobbyEvent(socket_io.Socket socket, String lobbyId) {
    socket.emit(GameOnlineSocketEvent.joinLobbyRequest.text, lobbyId);
  }

  void emitQuitLobbyEvent(socket_io.Socket socket, String lobbyId) {
    socket.emit(GameOnlineSocketEvent.quitLobbyRequest.text, lobbyId);
  }

}