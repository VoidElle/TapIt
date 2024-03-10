import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;
import 'package:tapit/game/online/providers/game_online_names_parser_provider.dart';

import '../../enums/socket_enums.dart';

mixin GameOnlineSocketExchangeInfoListenerMixin {

  void listenToExchangeInfo({
    required BuildContext context,
    required socket_io.Socket socket,
    required WidgetRef ref,
  }) {

    // Listen to a SUCCESS information's exchange
    socket.on(GameOnlineSocketEvent.exchangeInfoResponseSuccess.text, (dynamic data) {

      if (!context.mounted) {
        return;
      }

      // Parse the dynamic data to json
      final Map<String, dynamic> jsonReceived = data as Map<String, dynamic>;

      // Get the socket id which the data refers to
      final String socketId = jsonReceived["socketId"];

      // Received and adding the name of the enemy socket to the sockets names list
      final String enemySocketName = jsonReceived["socketName"];
      ref.read(gameOnlineNamesParserProvider.notifier).addName(socketId, enemySocketName);

    });

    // Listen to a FAILED information's exchange
    socket.on(GameOnlineSocketEvent.exchangeInfoResponseFail.text, (dynamic data) {

      if (!context.mounted) {
        return;
      }

      // Parse the dynamic data to json
      final Map<String, dynamic> jsonReceived = data as Map<String, dynamic>;

    });

  }

}