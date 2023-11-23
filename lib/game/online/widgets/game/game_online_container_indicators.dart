import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;

import '../../../../global/models/global_socket_model.dart';
import '../../../../global/providers/global_socket_provider.dart';
import '../../models/lobby/game_online_lobby_model.dart';
import '../../models/socket/game_online_socket_model.dart';
import '../../providers/game_online_lobby_provider.dart';
import '../../utils/game_online_text_styles.dart';

class GameOnlineContainerIndicators extends ConsumerWidget {

  const GameOnlineContainerIndicators({
    super.key,
  });

  Widget _textIndicator({ bool reversed = false, required String text }) {
    return Transform.rotate(
      angle: reversed ? pi : 0,
      child: Opacity(
        opacity: .6,
        child: Text(
          text.toUpperCase(),
          style: GameOnlineTextStyles.titleTextStyle(
            shadowColor: Colors.transparent
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final GlobalSocketModel socketProvider = ref.watch(globalSocketProvider);
    final socket_io.Socket? socket = socketProvider.socket;

    final GameOnlineLobbyModel gameOnlineLobbyModel = ref.watch(gameOnlineLobbyProvider);
    final List<GameOnlineSocketModel> socketsInGame = gameOnlineLobbyModel.sockets;

    return Column(
      children: [

        Expanded(
          child: Center(
            child: _textIndicator(
              reversed: true,
              text: socketsInGame.first.socketId == socket?.id
                  ? "YOU"
                  : "",
            ),
          ),
        ),

        Expanded(
          child: Center(
            child: _textIndicator(
              text: socketsInGame.last.socketId == socket?.id
                  ? "YOU"
                  : "",
            ),
          ),
        ),

      ],
    );
  }

}
