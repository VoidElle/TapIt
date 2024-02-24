import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/enums/socket_enums.dart';
import 'package:tapit/game/online/models/player/game_online_player_model.dart';
import 'package:tapit/game/online/providers/game_online_game_provider.dart';
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

      final GameOnlineGameNotifier gameProvider = ref.read(gameOnlineGameProvider.notifier);
      final Map<String, dynamic> winnerLoserPlayers = gameProvider.getWinnerLoserPlayer();

      // If the winner socket id is the same of the client's one
      // show the win dialog
      if (socket.id == winnerSocketId) {
        final GameOnlinePlayerModel winnerPlayer = winnerLoserPlayers["winner"];
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext _) => GameOnlineGameResultDialog(
            winnerColor: Color(winnerPlayer.colorValue),
            gameResult: GameResult.win,
          ),
        );
        return;
      }

      // Show the lose dialog
      final GameOnlinePlayerModel loserPlayer = winnerLoserPlayers["loser"];
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext _) => GameOnlineGameResultDialog(
          winnerColor: Color(loserPlayer.colorValue),
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