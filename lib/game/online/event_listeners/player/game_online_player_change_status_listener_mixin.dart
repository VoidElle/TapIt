import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;
import 'package:tapit/game/online/providers/game_online_game_provider.dart';

import '../../../../global/providers/global_socket_provider.dart';
import '../../enums/socket_enums.dart';

mixin GameOnlinePlayerChangeStatusListenerMixin {

  void listenToPlayerChangeStatusEvent({
    required BuildContext context,
    required WidgetRef ref,
  }) {

    final socket_io.Socket? socket = ref.read(globalSocketProvider).socket;

    socket?.on(GameOnlineSocketEvent.playerChangeReadyStatus.text, (dynamic data) {

      if (!context.mounted) {
        return;
      }

      // Get the JSON
      final Map<String, dynamic> jsonReceived = data as Map<String, dynamic>;
      final String socketId = jsonReceived["socket"];

      final GameOnlineGameNotifier gameOnlineGameNotifier = ref.read(gameOnlineGameProvider.notifier);
      gameOnlineGameNotifier.changeReadyStatus(socketId);

    });

  }

}