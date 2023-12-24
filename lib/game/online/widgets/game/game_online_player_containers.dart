import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/game/game_online_game_model.dart';
import '../../providers/game_online_game_provider.dart';

class GameOnlinePlayersContainers extends ConsumerWidget {

  final Duration animationDuration;

  const GameOnlinePlayersContainers({
    super.key,
    this.animationDuration = const Duration(milliseconds: 150),
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final GameOnlineGameModel gameOnlineState = ref.watch(gameOnlineGameProvider);

    return Column(
      children: [

        // Top player's container
        AnimatedContainer(
          duration: animationDuration,
          height: _getValueFromPercentage(context, gameOnlineState.players.first.percentageValue),
          color: Color(gameOnlineState.players.first.colorValue),
        ),

        // Bottom player's container
        AnimatedContainer(
          duration: animationDuration,
          height: _getValueFromPercentage(context, gameOnlineState.players.last.percentageValue),
          color: Color(gameOnlineState.players.last.colorValue),
        ),

      ],
    );
  }

  double _getValueFromPercentage(BuildContext context, int percentage) {
    return MediaQuery.of(context).size.height * percentage / 100;
  }

}
