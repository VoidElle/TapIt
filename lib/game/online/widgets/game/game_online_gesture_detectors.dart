import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/models/game/game_online_game_model.dart';
import 'package:tapit/game/online/models/player/game_online_player_model.dart';
import 'package:tapit/game/online/providers/game_online_game_provider.dart';
import 'package:tapit/global/providers/global_socket_provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;

import '../../../../global/utils/global_constants.dart';

class GameOnlineGestureDetectors extends ConsumerStatefulWidget {

  const GameOnlineGestureDetectors({super.key});

  @override
  ConsumerState<GameOnlineGestureDetectors> createState() => _GameOnlineGestureDetectorsState();
}

class _GameOnlineGestureDetectorsState extends ConsumerState<GameOnlineGestureDetectors> {

  late socket_io.Socket _socket;

  @override
  void initState() {

    super.initState();

    _socket = ref.read(globalSocketProvider).socket!;

  }

  @override
  Widget build(BuildContext context) {

    final GameOnlineGameModel gameOnlineGameModel = ref.watch(gameOnlineGameProvider);
    final List<GameOnlinePlayerModel> players = gameOnlineGameModel.players;

    return Column(
      children: [

        // Top tap detector
        Expanded(
          child: GestureDetector(
            onTapUp: (TapUpDetails _) {
              if (players.first.gameOnlineSocketModel.socketId == _socket.id) {
                debugPrint("Top container tap");
                _score(gameOnlineGameModel);
              }
            },
          ),
        ),

        // Bottom tap detector
        Expanded(
          child: GestureDetector(
            onTapUp: (TapUpDetails _) {
              if (players.last.gameOnlineSocketModel.socketId == _socket.id) {
                debugPrint("Bottom container tap");
                _score(gameOnlineGameModel);
              }
            },
          ),
        ),

      ],
    );
  }

  void _score(GameOnlineGameModel gameOnlineGameModel) {
    GlobalConstants.gameOnlineSocketEmitter.emitGameScoreEvent(
      socket: _socket,
      lobbyId: gameOnlineGameModel.lobbyId,
    );
  }

}
