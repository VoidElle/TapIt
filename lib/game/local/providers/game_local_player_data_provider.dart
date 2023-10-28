import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/local/models/game_local_player_model.dart';
import 'package:tapit/game/local/utils/game_local_enums.dart';
import 'package:tapit/global/utils/global_color_constants.dart';

import 'game_local_game_status_provider.dart';

final gameLocalPlayerDataNotifierProvider = StateNotifierProvider.autoDispose<GameLocalPlayerDataNotifier, List<GameLocalPlayerModel>>(
    (ref) => GameLocalPlayerDataNotifier(),
);

class GameLocalPlayerDataNotifier extends StateNotifier<List<GameLocalPlayerModel>> {

  // Constant of the score value percentage
  static const int scoreValue = 5;

  // Initial state of the provider
  static final List<GameLocalPlayerModel> _initialState = [
    GameLocalPlayerModel(colorValue: GlobalColorConstants.kRedColor.value),
    GameLocalPlayerModel(colorValue: GlobalColorConstants.kBlueColor.value)
  ];

  GameLocalPlayerDataNotifier() : super(_initialState);

  void reset() {

    // Creation of a new list, cannot use the initial state because of
    // cannot create a deep copy, only shallow
    final List<GameLocalPlayerModel> newState = [
      GameLocalPlayerModel(colorValue: GlobalColorConstants.kRedColor.value),
      GameLocalPlayerModel(colorValue: GlobalColorConstants.kBlueColor.value),
    ];

    state = [ ...newState ];
  }

  bool score(GameLocalPlayerEnum playerEnum) {

    // Get the current provider's state
    final previousState = state;

    // Getting the current and the new percentage value of the ATTACKER
    int attackerPercentageValueToSet = previousState[playerEnum == GameLocalPlayerEnum.top ? 0 : 1].percentageValue;
    final int newAttackerPercentageValue = attackerPercentageValueToSet + scoreValue;

    // Check if the new percentage value of the ATTACKER gets over 100%, if so
    // set the new value to 100%, if not set the new value to the expected one
    newAttackerPercentageValue > 100
        ? attackerPercentageValueToSet = 100
        : attackerPercentageValueToSet = newAttackerPercentageValue;

    // Getting the current and the new percentage value of the VICTIM
    int victimPercentageValueToSet = previousState[playerEnum == GameLocalPlayerEnum.top ? 1 : 0].percentageValue;
    final int newVictimPercentageValue = victimPercentageValueToSet - scoreValue;

    // Check if the new percentage value of the VICTIM gets over 100%, if so
    // set the new value to 100%, if not set the new value to the expected one
    newVictimPercentageValue < 0
        ? victimPercentageValueToSet = 0
        : victimPercentageValueToSet = newVictimPercentageValue;

    // Set the new percentages for both players, ATTACKER and VICTIM
    previousState[playerEnum == GameLocalPlayerEnum.top ? 0 : 1].percentageValue = attackerPercentageValueToSet;
    previousState[playerEnum == GameLocalPlayerEnum.top ? 1 : 0].percentageValue = victimPercentageValueToSet;

    // Update the state of the provider to the new one
    state = [...previousState];

    // Return if the attacker has won the game or not
    return attackerPercentageValueToSet == 100;
  }

  void updateReadyStatus(WidgetRef ref, int playerPosition, bool readyStatus) {

    // Get the current provider's state
    final newState = state;

    // Get the player from the provider's state
    final GameLocalPlayerModel gameLocalPlayerModel = state[playerPosition];

    // Set the player's ready status to the new one
    gameLocalPlayerModel.readyStatus = readyStatus;

    // Get the ready status of both players
    final bool topPlayerReadyStatus = newState[0].readyStatus;
    final bool bottomPlayerReadyStatus = newState[1].readyStatus;

    // Check ready status of both players,
    // if they're both ready. start the game
    if (topPlayerReadyStatus && bottomPlayerReadyStatus) {
      ref.read(gameLocalGameStatusNotifierProvider.notifier).startGame();
    }

    // Update the state of the provider to the new one
    state = [...newState];
  }

}