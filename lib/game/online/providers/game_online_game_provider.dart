import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/models/game/game_online_game_model.dart';

final gameOnlineGameProvider = StateNotifierProvider.autoDispose<GameOnlineGameNotifier, GameOnlineGameModel?>(
      (ref) => GameOnlineGameNotifier(),
);

class GameOnlineGameNotifier extends StateNotifier<GameOnlineGameModel?> {

  // Initial state of the Provider
  static const GameOnlineGameModel? _initialState = null;

  // Constructor of the provider
  GameOnlineGameNotifier(): super(_initialState);

  void setGameModel(GameOnlineGameModel gameModel) {
    state = gameModel;
  }

}