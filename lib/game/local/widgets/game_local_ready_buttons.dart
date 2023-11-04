import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/local/utils/game_local_text_styles.dart';

import '../../../global/utils/global_color_constants.dart';
import '../../../global/widgets/global_animated_button.dart';
import '../models/game_local_player_model.dart';
import '../providers/game_local_player_data_provider.dart';

class GameLocalReadyButtons extends ConsumerWidget {

  const GameLocalReadyButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final gameLocalPlayerData = ref.watch(gameLocalPlayerDataProvider);
    final gameLocalPlayerDataNotifier = ref.read(gameLocalPlayerDataProvider.notifier);

    final GameLocalPlayerModel topPlayer = gameLocalPlayerData[0];
    final GameLocalPlayerModel bottomPlayer = gameLocalPlayerData[1];

    final double deviceHeight = MediaQuery.of(context).size.height;
    const String buttonsText = "Ready";

    return Column(
      children: [

        // Top player's ready button
        SizedBox(
          height: deviceHeight / 2,
          width: double.infinity,
          child: Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: topPlayer.readyStatus ? 0 : 1,
              child: Transform.rotate(
                angle: pi,
                child: GlobalAnimatedButton(
                  height: 50,
                  width: 150,
                  canBePressed: true,
                  color: GlobalColorConstants.kBlackColor,
                  shadowColor: GlobalColorConstants.kDarkBlackColor,
                  onTapUp: () {

                    // Update the ready status of the TOP player setting it to true
                    gameLocalPlayerDataNotifier.updateReadyStatus(ref, 0, true);

                  },
                  child: Text(
                    buttonsText,
                    style: GameLocalTextStyles.readyButtonTextStyle(),
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
          child: Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: bottomPlayer.readyStatus ? 0 : 1,
              child: GlobalAnimatedButton(
                height: 50,
                width: 150,
                canBePressed: true,
                color: GlobalColorConstants.kBlackColor,
                shadowColor: GlobalColorConstants.kDarkBlackColor,
                onTapUp: () {

                  // Update the ready status of the BOTTOM player setting it to true
                  gameLocalPlayerDataNotifier.updateReadyStatus(ref, 1, true);

                },
                child: Text(
                  buttonsText,
                  style: GameLocalTextStyles.readyButtonTextStyle(),
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }

}
