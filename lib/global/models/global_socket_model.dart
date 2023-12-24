import 'package:socket_io_client/socket_io_client.dart' as socket_io;
import '../../game/online/enums/socket_enums.dart';

class GlobalSocketModel {

  socket_io.Socket? socket;
  GameOnlineSocketStatus gameOnlineSocketStatus;

  GlobalSocketModel({
    this.socket,
    this.gameOnlineSocketStatus = GameOnlineSocketStatus.toInit,
  });

}
