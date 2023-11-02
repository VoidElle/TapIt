import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;

import '../enums/socket_enums.dart';

final gameOnlineSocketProvider = StateNotifierProvider.autoDispose<GameOnlineSocketNotifier, Map>(
      (ref) => GameOnlineSocketNotifier(),
);

class GameOnlineSocketNotifier extends StateNotifier<Map> {

  static final Map _initialState = {
    "socket": null,
    "status": GameOnlineSocketStatus.toInit,
  };

  GameOnlineSocketNotifier(): super(_initialState);

  void init() {

    _setStatus(GameOnlineSocketStatus.loading, notify: false);

    late socket_io.Socket socket;

    socket = socket_io.io("http://10.0.2.2:3000/", <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });

    socket.connect();

    socket.onConnect((_) {
      debugPrint('SOCKET_INFO: Connection established');
      _setStatus(GameOnlineSocketStatus.success);
    });

    socket.onDisconnect((_) {
      debugPrint('SOCKET_INFO: Connection Disconnection');
      _setStatus(GameOnlineSocketStatus.disconnected);
    });

    socket.onConnectError((err) async {
      debugPrint(err);
      _setStatus(GameOnlineSocketStatus.error);
    });

    socket.onError((err) async {
      debugPrint(err);
      _setStatus(GameOnlineSocketStatus.error);
    });

    state["socket"] = socket;
  }

  void _setStatus(GameOnlineSocketStatus gameOnlineSocketStatus, {bool notify = true}) {
    final GameOnlineSocketStatus currentStatus = state["status"];
    if (currentStatus != gameOnlineSocketStatus) {
      if (notify) {
        state = {
          ...state,
          "status": gameOnlineSocketStatus,
        };
      } else {
        state["status"] = gameOnlineSocketStatus;
      }
    }
  }

  @override
  void dispose() {

    final socket_io.Socket? socket = state["socket"];
    if (socket != null) {
      socket.dispose();
    }

    super.dispose();
  }

}