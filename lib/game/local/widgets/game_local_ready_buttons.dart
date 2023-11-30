import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/local/providers/game_local_ready_buttons_visibility_provider.dart';
import 'package:tapit/game/local/utils/game_local_enums.dart';
import 'package:tapit/game/local/widgets/game_local_ready_button.dart';

import '../models/game_local_player_model.dart';
import '../providers/game_local_player_data_provider.dart';

class GameLocalReadyButtons extends ConsumerStatefulWidget {

  const GameLocalReadyButtons({super.key});

  @override
  ConsumerState<GameLocalReadyButtons> createState() => _GameLocalNewReadyButtonsState();
}

class _GameLocalNewReadyButtonsState extends ConsumerState<GameLocalReadyButtons> {

  @override
  Widget build(BuildContext context) {

    final gameLocalReadyButtonsVisibility = ref.watch(gameLocalReadyButtonsVisibilityProvider);
    final gameLocalReadyButtonsVisibilityNotifier = ref.read(gameLocalReadyButtonsVisibilityProvider.notifier);

    final gameLocalPlayerData = ref.watch(gameLocalPlayerDataProvider);
    final gameLocalPlayerDataNotifier = ref.read(gameLocalPlayerDataProvider.notifier);

    final GameLocalPlayerModel topPlayer = gameLocalPlayerData[0];
    final GameLocalPlayerModel bottomPlayer = gameLocalPlayerData[1];

    final double deviceHeight = MediaQuery.of(context).size.height;

    if (gameLocalReadyButtonsVisibility["top_ready_button_visible"] && topPlayer.readyStatus) {
      Future.delayed(const Duration(milliseconds: 250), () {
        gameLocalReadyButtonsVisibilityNotifier.setReadyButtonVisibility(GameLocalPlayerEnum.top, false);
      });
    }

    if (gameLocalReadyButtonsVisibility["bottom_ready_button_visible"] && bottomPlayer.readyStatus) {
      Future.delayed(const Duration(milliseconds: 250), () {
        gameLocalReadyButtonsVisibilityNotifier.setReadyButtonVisibility(GameLocalPlayerEnum.bottom, false);
      });
    }

    return Column(
      children: [

        // Top player's ready button
        SizedBox(
          height: deviceHeight / 2,
          width: double.infinity,
          child: Visibility(
            visible: gameLocalReadyButtonsVisibility["top_ready_button_visible"],
            child: Center(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: topPlayer.readyStatus ? 0 : 1,
                child: Transform.rotate(
                  angle: pi,
                  child: GameLocalReadyButton(
                    onTapCallback: () {

                      // Update the ready status of the TOP player setting it to true
                      gameLocalPlayerDataNotifier.updateReadyStatus(ref, 0, true);

                    },
                  ),
                ),
              ),
            ),
          ),
        ),

        // Bottom player's ready button
        SizedBox(
          height: deviceHeight / 2,
          width: double.infinity,
          child: Visibility(
            visible: gameLocalReadyButtonsVisibility["bottom_ready_button_visible"],
            child: Center(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: bottomPlayer.readyStatus ? 0 : 1,
                child: GameLocalReadyButton(
                  onTapCallback: () {

                    // Update the ready status of the BOTTOM player setting it to true
                    gameLocalPlayerDataNotifier.updateReadyStatus(ref, 1, true);

                  },
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
