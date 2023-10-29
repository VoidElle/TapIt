
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/game_online_socket_provider.dart';

class GameOnlineFunctions {

  static Future<String> createLobby(BuildContext context, WidgetRef ref) async {

    final socketNotifier = ref.read(gameOnlineSocketNotifierProvider.notifier);
    socketNotifier.init(context);

    return "";
  }

  static Future<bool> joinLobby(String lobbyId) async {
    return true;
  }

}