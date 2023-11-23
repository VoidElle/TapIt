import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/providers/game_online_lobby_provider.dart';
import 'package:tapit/global/providers/global_socket_provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;

import '../../../../global/models/global_socket_model.dart';
import '../../enums/socket_enums.dart';
import '../../models/lobby/game_online_lobby_model.dart';
import '../../models/socket/game_online_socket_model.dart';

class GameOnlineGestureDetectors extends ConsumerWidget {

  const GameOnlineGestureDetectors({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final GlobalSocketModel socketProvider = ref.watch(globalSocketProvider);
    final socket_io.Socket? socket = socketProvider.socket;

    final GameOnlineLobbyModel gameOnlineLobbyModel = ref.watch(gameOnlineLobbyProvider);
    final List<GameOnlineSocketModel> socketsInGame = gameOnlineLobbyModel.sockets;

    return Column(
      children: [

        // Top tap detector
        Expanded(
          child: GestureDetector(
            onTapUp: (TapUpDetails _) {
              if (socketsInGame.first.socketId == socket?.id) {
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
              if (socketsInGame.last.socketId == socket?.id) {
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
