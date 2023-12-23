import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/enums/socket_enums.dart';
import 'package:tapit/game/online/utils/game_online_functions.dart';
import 'package:tapit/global/utils/global_functions.dart';

import 'package:socket_io_client/socket_io_client.dart' as socket_io;

import '../../pages/lobby/new_game_online_lobby_page.dart';

mixin GameOnlineLobbyCreationListenerMixin {

  void listenToSocketLobbyCreationEvent({
    required BuildContext context,
    required socket_io.Socket? socket,
    required WidgetRef ref,
  }) {

    // Function that will be execute if the server send the lobby creation
    // SUCCESS event
    socket?.on(GameOnlineSocketEvent.createLobbyResponseSuccess.text, (dynamic data) {

      // Skip the event management if the context is not mounted
      if (!context.mounted) {
        return;
      }

      // Parse the dynamic data to json
      final Map<String, dynamic> jsonReceived = data as Map<String, dynamic>;

      // Create and set the new game model
      GameOnlineFunctions.createAndSetNewGameModel(jsonReceived, ref);

      // Redirect the player to the Lobby page
      GlobalFunctions.redirectAndClearRootTree(NewGameOnlineLobbyPage.route);

    });

    // Function that will be execute if the server send the lobby creation
    // ERROR event
    socket?.on(GameOnlineSocketEvent.createLobbyResponseFail.text, (dynamic data) {
      GlobalFunctions.showErrorDialog(
        shouldPopBefore: false,
        error: "Lobby creation failed",
        content: "An error has occurred during the creation of the lobby\nPlease try again!",
      );
    });

  }

}