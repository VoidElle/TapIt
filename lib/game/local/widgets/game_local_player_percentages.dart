import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/local/utils/game_local_text_styles.dart';

import '../models/game_local_player_model.dart';
import '../providers/game_local_player_data_provider.dart';

class GameLocalPlayersPercentages extends ConsumerWidget {

  const GameLocalPlayersPercentages({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final gameLocalPlayerData = ref.watch(gameLocalPlayerDataNotifierProvider);

    final GameLocalPlayerModel topPlayer = gameLocalPlayerData[0];
    final GameLocalPlayerModel bottomPlayer = gameLocalPlayerData[1];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [

            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: Transform.rotate(
                  angle: pi,
                  child: Text(
                    "${topPlayer.percentageValue}%",
                    style: GameLocalTextStyles.percentageTextStyle(),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "${bottomPlayer.percentageValue}%",
                  style: GameLocalTextStyles.percentageTextStyle(),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

}
