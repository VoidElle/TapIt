import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/local/providers/game_local_player_data_provider.dart';

import '../models/game_local_player_model.dart';

class GameLocalPlayersContainers extends ConsumerWidget {

  final Duration animationDuration;

  const GameLocalPlayersContainers({
    Key? key,
    this.animationDuration = const Duration(milliseconds: 150),
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final gameLocalPlayerData = ref.watch(gameLocalPlayerDataNotifierProvider);

    final GameLocalPlayerModel topPlayer = gameLocalPlayerData[0];
    final GameLocalPlayerModel bottomPlayer = gameLocalPlayerData[1];

    return Column(
      children: [

        AnimatedContainer(
          duration: animationDuration,
          height: _getValueFromPercentage(context, topPlayer.percentageValue),
          color: Color(topPlayer.colorValue),
        ),

        AnimatedContainer(
          duration: animationDuration,
          height: _getValueFromPercentage(context, bottomPlayer.percentageValue),
          color: Color(bottomPlayer.colorValue),
        ),

      ],
    );
  }

  double _getValueFromPercentage(BuildContext context, int percentage) {
    return MediaQuery.of(context).size.height * percentage / 100;
  }

}
