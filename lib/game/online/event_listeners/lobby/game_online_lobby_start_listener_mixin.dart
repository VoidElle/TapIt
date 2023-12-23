import 'package:flutter/material.dart';
import 'package:tapit/game/online/enums/socket_enums.dart';
import 'package:tapit/game/online/pages/game_online_page.dart';
import 'package:tapit/global/utils/global_functions.dart';

import 'package:socket_io_client/socket_io_client.dart' as socket_io;

mixin GameOnlineLobbyStartListenerMixin {

  void listenLobbyStartEvent({
    required BuildContext context,
    required socket_io.Socket socket,
  }) {

    // Start lobby - SUCCESS event
    socket.on(GameOnlineSocketEvent.startLobbyResponseSuccess.text, (dynamic data) {

      if (!context.mounted) {
        return;
      }

      GlobalFunctions.redirectAndClearRootTree(GameOnlinePage.route);

    });

    // Start lobby - FAIL event
    socket.on(GameOnlineSocketEvent.startLobbyResponseFail.text, (dynamic data) {
      GlobalFunctions.showErrorDialog(
        shouldPopBefore: false,
        error: "Game starting failed",
        content: "An error has occurred starting the lobby\nPlease try again!",
      );
    });

  }

}