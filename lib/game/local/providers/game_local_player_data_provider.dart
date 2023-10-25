import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/local/models/game_local_player_model.dart';
import 'package:tapit/global/utils/global_color_constants.dart';

import 'game_local_game_status_provider.dart';

final gameLocalPlayerDataNotifierProvider = StateNotifierProvider.autoDispose<GameLocalPlayerDataNotifier, List<GameLocalPlayerModel>>(
    (ref) => GameLocalPlayerDataNotifier(),
);

class GameLocalPlayerDataNotifier extends StateNotifier<List<GameLocalPlayerModel>> {

  static const int scoreValue = 5;

  GameLocalPlayerDataNotifier() : super([

    // Top player
    GameLocalPlayerModel(
      colorValue: GlobalColorConstants.kRedColor.value,
    ),

    // Bottom player
    GameLocalPlayerModel(
      colorValue: GlobalColorConstants.kBlueColor.value,
    ),

  ]);

  void score(WidgetRef ref, int attackerPosition, int victimPosition) {

    final gameLocalGameStatusProvider = ref.watch(gameLocalGameStatusNotifierProvider);
    final bool gameStarted = gameLocalGameStatusProvider["game_started"];

    if (gameStarted) {

      final previousState = state;

      int attackerPercentageValueToSet = previousState[attackerPosition].percentageValue;
      int newAttackerPercentageValue = attackerPercentageValueToSet + scoreValue;

      newAttackerPercentageValue > 100
          ? attackerPercentageValueToSet = 100
          : attackerPercentageValueToSet = newAttackerPercentageValue;

      int victimPercentageValueToSet = previousState[victimPosition].percentageValue;
      int newVictimPercentageValue = victimPercentageValueToSet - scoreValue;

      newVictimPercentageValue < 0
          ? victimPercentageValueToSet = 0
          : victimPercentageValueToSet = newVictimPercentageValue;

      previousState[attackerPosition].percentageValue = attackerPercentageValueToSet;
      previousState[victimPosition].percentageValue = victimPercentageValueToSet;

      state = [...previousState];

    }

  }

  void updateReadyStatus(WidgetRef ref, int playerPosition, bool readyStatus) {

    final newState = state;
    final GameLocalPlayerModel gameLocalPlayerModel = state[playerPosition];

    gameLocalPlayerModel.readyStatus = readyStatus;

    if (newState[0].readyStatus && newState[1].readyStatus) {
      ref.read(gameLocalGameStatusNotifierProvider.notifier).startGame();
    }

    state = [...newState];
  }

}