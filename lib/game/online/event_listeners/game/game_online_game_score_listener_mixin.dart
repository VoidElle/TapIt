import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/enums/socket_enums.dart';
import 'package:tapit/game/online/providers/game_online_game_provider.dart';
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
      final String attackerSocketId = jsonReceived["socketId"];

      debugPrint("$attackerSocketId scored!");

      final GameOnlineGameNotifier gameOnlineGameNotifier = ref.read(gameOnlineGameProvider.notifier);
      gameOnlineGameNotifier.score(attackerSocketId);

    });

    socket?.on(GameOnlineSocketEvent.gameScoreResponseFail.text, (dynamic data) {
      GlobalFunctions.showErrorDialog(
        shouldPopBefore: false,
        error: "Score failed",
        content: "An error has occurred emitting the score\nPlease try again!",
      );
    });

  }

}