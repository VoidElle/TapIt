import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameLocalGameStatusNotifierProvider = StateNotifierProvider.autoDispose<GameLocalGameStatusNotifier, Map>(
    (ref) => GameLocalGameStatusNotifier(),
);

class GameLocalGameStatusNotifier extends StateNotifier<Map> {

  static final Map _initialState = {
    "game_started": false,
  };

  GameLocalGameStatusNotifier(): super(_initialState);

  void startGame() {

    final newState = {
      ...state,
      "game_started": true,
    };

    state = newState;
  }

  void reset() {
    state = { ..._initialState };
  }

}