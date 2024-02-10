import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/enums/socket_enums.dart';
import 'package:tapit/game/online/providers/game_online_game_provider.dart';
import 'package:tapit/global/utils/global_constants.dart';
import 'package:tapit/global/utils/global_functions.dart';

import 'package:socket_io_client/socket_io_client.dart' as socket_io;

mixin GameOnlineGameScoreListenerMixin {

  void listenToGameScoreEvent({
    required BuildContext context,
    required socket_io.Socket? socket,
    required WidgetRef ref,
  }) {

    socket?.on(GameOnlineSocketEvent.gameScoreResponseSuccess.text, (dynamic data) {

      // Skip the event management if the context is not mounted
      if (!context.mounted) {
        return;
      }

      // Parse the dynamic data to json
      final Map<String, dynamic> jsonReceived = data as Map<String, dynamic>;

      // Get the attacker's socket id from the json
      final String attackerSocketId = jsonReceived["attackerId"];
      final String victimSocketId = jsonReceived["victimId"];

      // Log the scoring event
      GlobalConstants.logger.i("""
        SCORE SUCCESS
        ATTACKER SOCKET ID: $attackerSocketId
        VICTIM SOCKET ID: $victimSocketId
      """);

      // Get the notifier, and call the score's function
      final GameOnlineGameNotifier gameOnlineGameNotifier = ref.read(gameOnlineGameProvider.notifier);
      gameOnlineGameNotifier.score(
        attackerSocketId: attackerSocketId,
        victimSocketId: victimSocketId,
        ref: ref,
      );

    });

    // If the event goes in the error state, show an error dialog
    socket?.on(GameOnlineSocketEvent.gameScoreResponseFail.text, (dynamic data) {
      GlobalFunctions.showErrorDialog(
        shouldPopBefore: false,
        error: "Score failed",
        content: "An error has occurred emitting the score\nPlease try again!",
      );
    });

  }

}