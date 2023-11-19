import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/lobby/game_online_lobby_model.dart';
import '../../models/socket/game_online_socket_model.dart';
import '../../providers/game_online_lobby_provider.dart';
import 'game_online_lobby_ready_status_circular.dart';

class GameOnlineLobbySocketsList extends ConsumerWidget {

  final String leaderSocket;

  const GameOnlineLobbySocketsList({
    required this.leaderSocket,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // Get the current state of the currents sockets connected to the lobby
    final GameOnlineLobbyModel onlineLobbyState = ref.watch(gameOnlineLobbyProvider);

    return Column(
      children: [

        for (GameOnlineSocketModel socket in onlineLobbyState.sockets)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Text with the socket id
              Text(
                socket.socketId,
              ),

              // If the rendered socket is the player
              // a text with "(You)" is shown
              if (socket.socketId == leaderSocket)
                const Text(
                  " (You)",
                ),

              const SizedBox(
                width: 5,
              ),

              // Circular container to show the ready status of the socket
              // green (ready) or red (not ready)
              GameOnlineLobbyReadyStatusCircular(
                readyStatus: socket.readyStatus,
              ),

            ],
          ),

      ],
    );
  }

}
