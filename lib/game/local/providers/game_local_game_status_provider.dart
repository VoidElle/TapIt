import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameLocalGameStatusNotifierProvider = StateNotifierProvider.autoDispose<GameLocalGameStatusNotifier, Map>(
    (ref) => GameLocalGameStatusNotifier(),
);

class GameLocalGameStatusNotifier extends StateNotifier<Map> {

  GameLocalGameStatusNotifier(): super({
    "game_started": false,
  });

  void startGame() {

    final newState = {
      ...state,
      "game_started": true,
    };

    state = newState;
  }

}