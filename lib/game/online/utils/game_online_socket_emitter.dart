import 'package:socket_io_client/socket_io_client.dart' as socket_io;
import 'package:tapit/game/online/enums/socket_enums.dart';

class GameOnlineSocketEmitter {

  static void emitCreateLobbyEvent() {

  }

  static void emitJoinLobbyEvent(socket_io.Socket socket, String lobbyId) {
    socket.emit(GameOnlineSocketEvent.joinLobbyRequest.text, lobbyId);
  }

}