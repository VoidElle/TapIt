import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/models/game/game_online_game_model.dart';
import 'package:tapit/game/online/models/player/game_online_player_model.dart';
import 'package:tapit/game/online/providers/game_online_game_provider.dart';
import 'package:tapit/global/providers/global_socket_provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;

import '../../../../global/models/global_socket_model.dart';
import '../../enums/socket_enums.dart';

class GameOnlineGestureDetectors extends ConsumerWidget {

  const GameOnlineGestureDetectors({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final GlobalSocketModel socketProvider = ref.watch(globalSocketProvider);
    final socket_io.Socket? socket = socketProvider.socket;

    final GameOnlineGameModel gameOnlineGameModel = ref.watch(gameOnlineGameProvider);
    final List<GameOnlinePlayerModel> players = gameOnlineGameModel.players;

    return Column(
      children: [

        // Top tap detector
        Expanded(
          child: GestureDetector(
            onTapUp: (TapUpDetails _) {
              if (players.first.gameOnlineSocketModel.socketId == socket?.id) {
                debugPrint("Top container tap");
                socket?.emit(GameOnlineSocketEvent.gameScore.text, socket.id);
              }
            },
          ),
        ),

        // Bottom tap detector
        Expanded(
          child: GestureDetector(
            onTapUp: (TapUpDetails _) {
              if (players.last.gameOnlineSocketModel.socketId == socket?.id) {
                debugPrint("Bottom container tap");
                socket?.emit(GameOnlineSocketEvent.gameScore.text, socket.id);
              }
            },
          ),
        ),

      ],
    );
  }

}
