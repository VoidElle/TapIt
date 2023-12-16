import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;
import 'package:tapit/game/online/models/game/game_online_game_model.dart';
import 'package:tapit/game/online/models/player/game_online_player_model.dart';
import 'package:tapit/game/online/models/socket/game_online_socket_model.dart';
import 'package:tapit/global/utils/global_color_constants.dart';

import '../enums/socket_enums.dart';
import '../providers/game_online_game_provider.dart';

mixin GameOnlineSocketLobbyPlayersChangeListenerMixin {

  void listenToPlayerChange(socket_io.Socket? socket, WidgetRef ref) {

    socket?.on(GameOnlineSocketEvent.joinLobbyResponseSuccess.text, (dynamic data) {

      // Parse the dynamic data to json
      final Map<String, dynamic> jsonData = data as Map<String, dynamic>;

      // Get the list of connected sockets
      final List<dynamic>? socketsList = jsonData["sockets"];
      final List<GameOnlineSocketModel> socketsParsedList = [];

      // Parse the list of connected sockets
      if (socketsList != null) {
        for (dynamic socket in socketsList) {
          socketsParsedList.add(
            GameOnlineSocketModel.fromJson(socket as Map<String, dynamic>),
          );
        }
      }

      // Get the provider and the notifier of the Online Game
      final gameOnlineGameState = ref.read(gameOnlineGameProvider);
      final gameOnlineGameStateNotifier = ref.read(gameOnlineGameProvider.notifier);

      // Parse the Sockets players to the effective player's model
      final List<GameOnlinePlayerModel> players = [];
      for (GameOnlineSocketModel gameOnlineSocketModel in socketsParsedList) {
        final GameOnlinePlayerModel gameOnlinePlayerModel = GameOnlinePlayerModel(
          gameOnlineSocketModel: gameOnlineSocketModel,
          colorValue: GlobalColorConstants.kBlueColor.value,
        );
        players.add(gameOnlinePlayerModel);
      }

      // Create a new game model (Cannot modify immutable lists using freezed)
      final GameOnlineGameModel gameOnlineGameModel = GameOnlineGameModel(
        lobbyId: gameOnlineGameState.lobbyId,
        players: players,
      );

      // Set the new game model
      gameOnlineGameStateNotifier.setGameModel(gameOnlineGameModel);
    });

  }


}