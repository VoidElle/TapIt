import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/enums/socket_enums.dart';
import 'package:tapit/global/utils/global_color_constants.dart';
import 'package:tapit/global/utils/global_functions.dart';

import 'package:socket_io_client/socket_io_client.dart' as socket_io;

import '../../dialogs/game/game_online_game_result_dialog.dart';

mixin GameOnlineGameWinListenerMixin {

  void listenToGameWinEvent({
    required BuildContext context,
    required socket_io.Socket socket,
    required WidgetRef ref,
  }) {

    // Listening to the success event
    socket.on(GameOnlineSocketEvent.gameWinResponseSuccess.text, (dynamic data) {

      // Skip the event management if the context is not mounted
      if (!context.mounted) {
        return;
      }

      // Parse the dynamic data to json
      final Map<String, dynamic> jsonReceived = data as Map<String, dynamic>;

      // Get the winner's socket id from the json
      final String winnerSocketId = jsonReceived["socketId"];

      // If the winner socket id is the same of the client's one
      // show the win dialog
      if (socket.id == winnerSocketId) {
        showDialog(
          context: context,
          builder: (BuildContext _) => const GameOnlineGameResultDialog(
            winnerColor: GlobalColorConstants.kBlueColor,
            gameResult: GameResult.win,
          ),
        );
        return;
      }

      // Show the lose dialog
      showDialog(
        context: context,
        builder: (BuildContext _) => const GameOnlineGameResultDialog(
          winnerColor: GlobalColorConstants.kBlueColor,
          gameResult: GameResult.lose,
        ),
      );

    });

    // If the event goes in the error state, show an error dialog
    socket.on(GameOnlineSocketEvent.gameWinResponseFail.text, (dynamic data) {
      GlobalFunctions.showErrorDialog(
        shouldPopBefore: false,
        error: "Win failed",
        content: "An error has occurred finishing the game\nPlease try again!",
      );
    });

  }

}