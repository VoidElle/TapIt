import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/local/dialogs/game_local_win_dialog.dart';
import 'package:tapit/game/local/providers/game_local_game_status_provider.dart';
import 'package:tapit/game/local/utils/game_local_enums.dart';

import '../providers/game_local_player_data_provider.dart';

class GameLocalGestureDetectors extends ConsumerWidget {

  const GameLocalGestureDetectors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final gameStatus = ref.watch(gameLocalGameStatusNotifierProvider);

    final gameLocalPlayerData = ref.watch(gameLocalPlayerDataNotifierProvider);
    final gameLocalPlayerDataNotifier = ref.read(gameLocalPlayerDataNotifierProvider.notifier);

    final bool gameStarted = gameStatus["game_started"];

    return Column(
      children: [

        Expanded(
          child: GestureDetector(
            onTapUp: (TapUpDetails _) {
              debugPrint("Top tap $gameStatus");
              if (gameStarted) {
                final bool playerWon = gameLocalPlayerDataNotifier.score(GameLocalPlayerEnum.top);
                if (playerWon) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => GameLocalWinDialog(
                      gameLocalPlayerEnum: GameLocalPlayerEnum.top,
                      winnerColor: Color(gameLocalPlayerData[0].colorValue),
                    ),
                  );
                }
              }
            },
          ),
        ),

        Expanded(
          child: GestureDetector(
            onTapUp: (TapUpDetails _) {
              debugPrint("Bottom tap $gameStatus");
              if (gameStarted) {
                final bool playerWon = gameLocalPlayerDataNotifier.score(GameLocalPlayerEnum.bottom);
                if (playerWon) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => GameLocalWinDialog(
                      gameLocalPlayerEnum: GameLocalPlayerEnum.bottom,
                      winnerColor: Color(gameLocalPlayerData[1].colorValue),
                    ),
                  );
                }
              }
            },
          ),
        ),

      ],
    );
  }

}
