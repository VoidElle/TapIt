import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;

import '../../game/online/enums/socket_enums.dart';

part 'global_socket_model.freezed.dart';

@unfreezed
class GlobalSocketModel with _$GlobalSocketModel {

  GlobalSocketModel._();

  factory GlobalSocketModel({
    @Default(null) socket_io.Socket? socket,
    @Default(GameOnlineSocketStatus.toInit) GameOnlineSocketStatus gameOnlineSocketStatus,
  }) = _GlobalSocketModel;

}