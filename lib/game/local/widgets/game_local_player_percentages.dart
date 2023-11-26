import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/game_local_player_model.dart';
import '../providers/game_local_player_data_provider.dart';
import 'game_local_player_percentage.dart';

class GameLocalPlayersPercentages extends ConsumerWidget {

  const GameLocalPlayersPercentages({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final gameLocalPlayerData = ref.watch(gameLocalPlayerDataProvider);

    final GameLocalPlayerModel topPlayer = gameLocalPlayerData[0];
    final GameLocalPlayerModel bottomPlayer = gameLocalPlayerData[1];

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
                  child: GameLocalPlayersPercentage(
                    value: topPlayer.percentageValue,
                  ),
                ),
              ),
            ),

            // Bottom player's value percentage
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: GameLocalPlayersPercentage(
                  value: bottomPlayer.percentageValue,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

}
