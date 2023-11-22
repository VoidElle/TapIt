import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/models/game/game_online_game_model.dart';

final gameOnlineGameProvider = StateNotifierProvider.autoDispose<GameOnlineGameNotifier, GameOnlineGameModel>(
      (ref) => GameOnlineGameNotifier(),
);

class GameOnlineGameNotifier extends StateNotifier<GameOnlineGameModel> {

  // Initial state of the Provider
  static final GameOnlineGameModel _initialState = GameOnlineGameModel(
    lobbyId: "",
  );

  // Constructor of the provider
  GameOnlineGameNotifier(): super(_initialState);

  void setGameModel(GameOnlineGameModel gameModel, { notify = true }) {
    if (notify) {
      state = gameModel;
    } else {
      state.lobbyId = gameModel.lobbyId;
      state.players = gameModel.players;
    }
  }

}