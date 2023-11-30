import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/local/utils/game_local_enums.dart';

final gameLocalReadyButtonsVisibilityProvider = StateNotifierProvider.autoDispose<GameLocalReadyButtonsVisibilityNotifier, Map>(
      (ref) => GameLocalReadyButtonsVisibilityNotifier(),
);

class GameLocalReadyButtonsVisibilityNotifier extends StateNotifier<Map> {

  // Initial state of the provider
  static final Map _initialState = {
    "top_ready_button_visible": true,
    "bottom_ready_button_visible": true,
  };

  GameLocalReadyButtonsVisibilityNotifier(): super({ ..._initialState });

  void setReadyButtonVisibility(GameLocalPlayerEnum gameLocalPlayerEnum, bool value) {

    final Map newState = { ...state };

    switch(gameLocalPlayerEnum) {
      case GameLocalPlayerEnum.top:
        newState["top_ready_button_visible"] = true;
        break;
      case GameLocalPlayerEnum.bottom:
        newState["bottom_ready_button_visible"] = true;
        break;
    }

    state = newState;
  }

  void reset() {
    final Map newState = { ..._initialState };
    state = newState;
  }

}