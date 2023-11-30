import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/local/dialogs/game_local_new_win_dialog.dart';
import 'package:tapit/game/local/providers/game_local_game_status_provider.dart';
import 'package:tapit/game/local/utils/game_local_enums.dart';

import '../../../global/utils/global_constants.dart';
import '../../../global/utils/managers/global_shared_preferences_manager.dart';
import '../../../global/utils/managers/global_sounds_manager.dart';
import '../providers/game_local_player_data_provider.dart';

class GameLocalGestureDetectors extends ConsumerWidget {

  const GameLocalGestureDetectors({super.key});

  Future<void> checkAndPlaySound() async {

    final GlobalSharedPreferencesManager globalSharedPreferencesManager = GlobalConstants.globalSharedPreferencesManager;
    final GlobalSoundsManager globalSoundsManager = GlobalConstants.globalSoundsManager;

    if (globalSharedPreferencesManager.getFxSoundsEnabled()) {
      await globalSoundsManager.playGameTapFx();
    }

  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final gameStatus = ref.watch(gameLocalGameStatusProvider);

    final gameLocalPlayerData = ref.watch(gameLocalPlayerDataProvider);
    final gameLocalPlayerDataNotifier = ref.read(gameLocalPlayerDataProvider.notifier);

    final bool gameStarted = gameStatus["game_started"];

    return Column(
      children: [

        // Top tap detector
        Expanded(
          child: GestureDetector(
            onTapUp: (TapUpDetails _) async {
              debugPrint("Top tap $gameStatus");
              if (gameStarted) {

                await checkAndPlaySound();

                // Score TOP player and store if it has won
                final bool playerWon = gameLocalPlayerDataNotifier.score(GameLocalPlayerEnum.top);

                // If the TOP player has won, show the win dialog
                if (playerWon && context.mounted) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => GameLocalNewWinDialog(
                      gameLocalPlayerEnum: GameLocalPlayerEnum.top,
                      winnerColor: Color(gameLocalPlayerData[0].colorValue),
                    ),
                  );
                }

              }
            },
          ),
        ),

        // Bottom tap detector
        Expanded(
          child: GestureDetector(
            onTapUp: (TapUpDetails _) async {
              debugPrint("Bottom tap $gameStatus");
              if (gameStarted) {

                await checkAndPlaySound();

                // Score BOTTOM player and store if it has won
                final bool playerWon = gameLocalPlayerDataNotifier.score(GameLocalPlayerEnum.bottom);

                // If the BOTTOM player has won, show the win dialog
                if (playerWon && context.mounted) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => GameLocalNewWinDialog(
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
