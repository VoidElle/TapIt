import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/game_player_percentage.dart';
import '../../models/game/game_online_game_model.dart';
import '../../models/player/game_online_player_model.dart';
import '../../providers/game_online_game_provider.dart';

class GameOnlinePlayersPercentages extends ConsumerWidget {

  const GameOnlinePlayersPercentages({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final GameOnlineGameModel gameOnlineGameState = ref.watch(gameOnlineGameProvider);
    final List<GameOnlinePlayerModel> playersList = gameOnlineGameState.players;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [

            // Top player's value percentage
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: Transform.rotate(
                  angle: pi,
                  child: GamePlayersPercentage(
                    value: playersList.first.percentageValue,
                  ),
                ),
              ),
            ),

            // Bottom player's value percentage
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: GamePlayersPercentage(
                  value: playersList.last.percentageValue,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

}
