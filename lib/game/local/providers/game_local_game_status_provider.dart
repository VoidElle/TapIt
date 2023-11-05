import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameLocalGameStatusProvider = StateNotifierProvider.autoDispose<GameLocalGameStatusNotifier, Map>(
    (ref) => GameLocalGameStatusNotifier(),
);

class GameLocalGameStatusNotifier extends StateNotifier<Map> {

  // Initial state of the provider
  static final Map _initialState = {
    "game_started": false,
    "has_player_won": false,
  };

  GameLocalGameStatusNotifier(): super({ ..._initialState });

  // Function to start the game
  void startGame() {

    final newState = {
      ...state,
      "game_started": true,
    };

    state = { ...newState };
  }

  // Function to set the player's won status
  void setPlayerWon(bool newPlayerWonStatus) {

    final newState = {
      ...state,
      "has_player_won": newPlayerWonStatus,
    };

    state = { ...newState };
  }

  // Function to reset the provider's state
  void reset() {
    state = { ..._initialState };
  }

}