import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;
import 'package:tapit/game/online/dialogs/game_online_leader_left_dialog.dart';
import 'package:tapit/game/online/models/game/game_online_game_model.dart';
import 'package:tapit/game/online/models/player/game_online_player_model.dart';
import 'package:tapit/game/online/utils/game_online_functions.dart';
import 'package:tapit/global/utils/global_constants.dart';
import 'package:tapit/menu/pages/menu_page.dart';

import '../../../../global/providers/global_player_name_provider.dart';
import '../../../../global/utils/global_functions.dart';
import '../../dialogs/game/game_online_opponent_disconnected_dialog.dart';
import '../../enums/socket_enums.dart';
import '../../pages/lobby/game_online_lobby_page.dart';
import '../../providers/game_online_game_provider.dart';

mixin GameOnlinePlayerChangeListenerMixin {

  void listenToPlayerChange({
    required BuildContext context,
    required socket_io.Socket socket,
    required WidgetRef ref,
    bool needsToJoin = false,
    bool isInGame = false,
  }) {

    // Listen to a player lobby join event only if the player is not already inside a match
    if (!isInGame) {

      // Success event
      socket.on(GameOnlineSocketEvent.joinLobbyResponseSuccess.text, (dynamic data) {

        // Skip the event management if the context is not mounted
        if (!context.mounted) {
          return;
        }

        // Parse the dynamic data to json
        final Map<String, dynamic> jsonReceived = data as Map<String, dynamic>;

        // Create and set the new game model
        GameOnlineFunctions.createAndSetNewGameModel(jsonReceived, ref);

        GlobalFunctions.executeAfterBuild(() {

          // If it's the guest socket, it needs to go the
          // lobby page where the leader is already
          if (needsToJoin) {
              GlobalFunctions.redirectAndClearRootTree(GameOnlineLobbyPage.route);
          }

          // Forcing the EXCHANGE_INFO event being emitted multiple times
          // (testing 5 times with a delay of 250ms)
          // to force the information to be exchanged between clients
          // TODO: Rework using a request if the name of the socket is not inside the list
          const emittingDelayTimeMs = 250;
          for (int i = 0; i < 5; i++) {
            Future.delayed(
              const Duration(milliseconds: emittingDelayTimeMs),
              () {

                if (!context.mounted){
                  return;
                }

                // Emitting the client's socket name
                final String clientSocketName = ref.read(globalPlayerNameProvider);
                GlobalConstants.gameOnlineSocketEmitter.emitExchangeInfoEvent(
                  socket: socket,
                  ref: ref,
                  socketName: clientSocketName,
                );

              },
            );
          }

        });


      });

      // Fail event
      socket.on(GameOnlineSocketEvent.joinLobbyResponseFail.text, (dynamic data) {

        // Skip the event management if the context is not mounted
        if (!context.mounted) {
          return;
        }

        // Parse the dynamic data to json
        final Map<String, dynamic> jsonReceived = data as Map<String, dynamic>;

        // Get the error from the json
        final String error = jsonReceived["error"];

      });

    }

    // Listen to a player lobby quit event
    socket.on(GameOnlineSocketEvent.quitLobbyResponseSuccess.text, (dynamic data) {

      if (!context.mounted) {
        return;
      }

      if (isInGame) {

        // Redirect the user to the Menu page
        GlobalFunctions.redirectAndClearRootTree(MenuPage.route);

        // Show the opponent player disconnected
        showDialog(
          context: context,
          builder: (BuildContext _) => const GameOnlineOpponentDisconnectedDialog(),
        );

        return;
      }

      // Parse the dynamic data to json
      final Map<String, dynamic> jsonData = data as Map<String, dynamic>;

      // Get the quitted socket id
      final String quittedSocketId = jsonData["socketId"];

      // Get the notifier of the Online Game
      final GameOnlineGameModel gameOnlineGameModel = ref.read(gameOnlineGameProvider);
      final gameOnlineGameStateNotifier = ref.read(gameOnlineGameProvider.notifier);

      final List<GameOnlinePlayerModel> newPlayers = GameOnlineFunctions.removePlayerFromList(quittedSocketId, gameOnlineGameModel.players);

      // Create a new game model (Cannot modify immutable lists using freezed)
      final GameOnlineGameModel newGameOnlineGameModel = GameOnlineGameModel(
        lobbyId: gameOnlineGameModel.lobbyId,
        players: newPlayers,
      );

      // Set the new game model
      gameOnlineGameStateNotifier.setGameModel(newGameOnlineGameModel);

    });

    // Listen to leader's leaving event
    socket.on(GameOnlineSocketEvent.leaderLeftLobby.text, (dynamic data) {

      if (!context.mounted) {
        return;
      }

      GlobalFunctions.redirectAndClearRootTree(MenuPage.route);

      final BuildContext? globalContext = GlobalConstants.navigatorKey.currentContext;
      if (globalContext != null) {
        showDialog(
          context: globalContext,
          builder: (BuildContext _) => const GameOnlineLeaderLeftDialog(),
        );
      }

    });

  }

}