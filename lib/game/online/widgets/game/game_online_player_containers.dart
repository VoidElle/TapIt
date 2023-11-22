import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/models/player/game_online_player_model.dart';

import '../../providers/game_online_game_provider.dart';

class GameOnlinePlayersContainers extends ConsumerWidget {

  final Duration animationDuration;

  const GameOnlinePlayersContainers({
    super.key,
    this.animationDuration = const Duration(milliseconds: 150),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final gameOnlineState = ref.watch(gameOnlineGameProvider);

    final GameOnlinePlayerModel topPlayer = gameOnlineState.players[0];
    final GameOnlinePlayerModel bottomPlayer = gameOnlineState.players[1];

    return Column(
      children: [

        // Top player's container
        AnimatedContainer(
          duration: animationDuration,
          height: _getValueFromPercentage(context, topPlayer.percentageValue),
          color: Color(topPlayer.colorValue),
        ),

        // Bottom player's container
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
