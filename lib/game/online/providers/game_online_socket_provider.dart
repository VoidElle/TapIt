import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum GameOnlineSocketProviderStatusEnum {
  toInit,
  success,
  loading,
  error
}

final gameOnlineSocketNotifierProvider = StateNotifierProvider<GameOnlineSocketNotifier, Map>(
      (ref) => GameOnlineSocketNotifier(),
);

class GameOnlineSocketNotifier extends StateNotifier<Map> {

  static final Map _initState = {
    "socket": null,
    "status": GameOnlineSocketProviderStatusEnum.toInit,
  };

  GameOnlineSocketNotifier(): super(_initState);

  void init(BuildContext context) {

    _setLoadingState();

    late IO.Socket socket;

    socket = IO.io("http://10.0.2.2:3000/", <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });

    socket.connect();

    socket.onConnect((_) {
      debugPrint('SOCKET_INFO: Connection established');
      _setSuccessfulState();
    });

    socket.onDisconnect((_) {
      debugPrint('SOCKET_INFO: Connection Disconnection');
    });

    socket.onConnectError((err) async {
      debugPrint(err);
      _setErrorState();
    });

    socket.onError((err) async {
      debugPrint(err);
      _setErrorState();
    });

    state = {
      ...state,
      "socket": socket,
    };

  }

  void _setLoadingState() {

    final Map newState = {
      ...state,
      "status": GameOnlineSocketProviderStatusEnum.loading,
    };

    if (!mapEquals(state, newState)) {
      state = {
        ...newState,
      };
    }

  }

  void _setSuccessfulState() {

    final Map newState = {
      ...state,
      "status": GameOnlineSocketProviderStatusEnum.success,
    };

    if (!mapEquals(state, newState)) {
      state = {
        ...newState,
      };
    }

  }

  void _setErrorState() {

    final Map newState = {
      ...state,
      "status": GameOnlineSocketProviderStatusEnum.error,
    };

    if (!mapEquals(state, newState)) {
      state = {
        ...newState,
      };
    }

  }

  void reset() {
    state = {
      "socket": null,
      "status": GameOnlineSocketProviderStatusEnum.toInit,
    };
  }

}