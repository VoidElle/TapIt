import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/local/providers/game_local_game_status_provider.dart';

import '../providers/game_local_player_data_provider.dart';

class GameLocalGestureDetectors extends ConsumerWidget {

  const GameLocalGestureDetectors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final gameStatus = ref.watch(gameLocalGameStatusNotifierProvider);
    final gameLocalPlayerDataNotifier = ref.read(gameLocalPlayerDataNotifierProvider.notifier);

    return Column(
      children: [

        Expanded(
          child: GestureDetector(
            onTapUp: (TapUpDetails _) {
              debugPrint("Top tap $gameStatus");
              gameLocalPlayerDataNotifier.score(ref, 0, 1);
            },
          ),
        ),

        Expanded(
          child: GestureDetector(
            onTapUp: (TapUpDetails _) {
              debugPrint("Bottom tap $gameStatus");
              gameLocalPlayerDataNotifier.score(ref, 1, 0);
            },
          ),
        ),

      ],
    );
  }

}
