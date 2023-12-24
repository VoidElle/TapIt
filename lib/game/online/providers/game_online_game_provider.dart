import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/models/game/game_online_game_model.dart';
import 'package:tapit/game/online/models/player/game_online_player_model.dart';

final gameOnlineGameProvider = StateNotifierProvider<GameOnlineGameNotifier, GameOnlineGameModel>(
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

  GameOnlinePlayerModel? getPlayer(String? socketId) {

    if (socketId == null) {
      return null;
    }

    final int position = _getPositionOfSocketIdInState(socketId);

    if (position == -1) {
      return null;
    }

    return state.players[position];
  }

  int _getPositionOfSocketIdInState(String socketId) {
    int i = 0;
    for (GameOnlinePlayerModel gameOnlinePlayerModel in state.players) {
      if (gameOnlinePlayerModel.gameOnlineSocketModel.socketId == socketId) {
        return i;
      }
      i++;
    }
    return -1;
  }

  void changeReadyStatus(String socketId) {

    final List<GameOnlinePlayerModel> newPlayersList = [...state.players ];

    for (GameOnlinePlayerModel gameOnlinePlayerModel in newPlayersList) {
      if (gameOnlinePlayerModel.gameOnlineSocketModel.socketId == socketId) {
        gameOnlinePlayerModel.readyStatus = !gameOnlinePlayerModel.readyStatus;
        break;
      }
    }

    final GameOnlineGameModel newState = GameOnlineGameModel(
      lobbyId: state.lobbyId,
      players: newPlayersList,
    );

    state = newState;
  }

  bool isSocketLeader(String socketId) {

    final GameOnlinePlayerModel? gameOnlinePlayerModel = getPlayer(socketId);

    if (gameOnlinePlayerModel == null) {
      return false;
    }

    return gameOnlinePlayerModel.gameOnlineSocketModel.isLeader;
  }

  void score(String socketId) {

    final int scoredSocketIdPosition = _getPositionOfSocketIdInState(socketId);

    final GameOnlinePlayerModel attackerPlayerModel = state.players[scoredSocketIdPosition];
    final GameOnlinePlayerModel victimPlayerModel = state.players[scoredSocketIdPosition == 0 ? 1 : 0];

    attackerPlayerModel.percentageValue += 5;
    victimPlayerModel.percentageValue -= 5;

    state = GameOnlineGameModel.fromJson(state.toJson());

  }

}