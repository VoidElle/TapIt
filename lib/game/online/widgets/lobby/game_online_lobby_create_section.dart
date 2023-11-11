import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/models/game_online_lobby_model.dart';
import 'package:tapit/game/online/providers/game_online_lobby_provider.dart';
import 'package:tapit/global/utils/global_functions.dart';
import 'package:tapit/menu/pages/menu_page.dart';

import '../../enums/socket_enums.dart';
import '../../../../global/providers/global_socket_provider.dart';
import '../../utils/game_online_text_styles.dart';

import 'package:socket_io_client/socket_io_client.dart' as socket_io;

import 'game_online_lobby_sockets_list.dart';

class GameOnlineLobbyCreateSection extends ConsumerStatefulWidget {

  final GameOnlineLobbyModel gameOnlineLobbyModel;

  const GameOnlineLobbyCreateSection({
    required this.gameOnlineLobbyModel,
    super.key,
  });

  @override
  ConsumerState<GameOnlineLobbyCreateSection> createState() => _GameOnlineLobbyCreateSectionState();
}

class _GameOnlineLobbyCreateSectionState extends ConsumerState<GameOnlineLobbyCreateSection> {

  // Declaration of timer to execute periodically the getSocketsInfo's event
  Timer? _timer;

  @override
  void initState() {

    // Getting the gameOnlineLobby state and notifier
    final onlineLobbyNotifier = ref.read(gameOnlineLobbyProvider.notifier);
    onlineLobbyNotifier.setSocketsList(widget.gameOnlineLobbyModel.sockets, notify: false);

    // Getting the socket from the provider
    final Map socketProvider = ref.read(globalSocketProvider);
    final socket_io.Socket? socket = socketProvider["socket"];

    socket?.on(GameOnlineSocketEvent.joinLobbyResponseSuccess.text, (dynamic data) {
      if (data != null) {

        final GameOnlineLobbyModel gameOnlineLobbyModel = GameOnlineLobbyModel.fromJson(data);
        onlineLobbyNotifier.setSocketsList(gameOnlineLobbyModel.sockets);

      }
    });

    socket?.on(GameOnlineSocketEvent.quitLobbyResponseSuccess.text, (dynamic data) {
      if (data != null) {

        final Map<String, dynamic> json = data as Map<String, dynamic>;
        final String socketId = json["quittedSocket"];

        onlineLobbyNotifier.removeSocketFromList(socketId);

      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // Getting the socket from the provider
    final Map socketProvider = ref.watch(globalSocketProvider);
    final socket_io.Socket? socket = socketProvider["socket"];

    return Column(
      children: [

        // Top text
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: AutoSizeText(
            "Share with your friend the code below to join this lobby",
            textAlign: TextAlign.center,
            maxLines: 2,
            style: GameOnlineTextStyles.lobbyInstructionTextStyle(),
          ),
        ),

        // Lobby id text
        Text(
          widget.gameOnlineLobbyModel.lobbyId,
          style: GameOnlineTextStyles.lobbyCodeTextStyle(),
        ),

        // Show the connected sockets' ids list
        if (socket != null)
          GameOnlineLobbySocketsList(
            leaderSocket: socket.id!,
          ),

        // Button to change the status of the socket
        TextButton(
          onPressed: () {

            // Emit the setReadyStatus' event to the server with the lobby id
            // socket?.emit(GameOnlineSocketEvent.setReadyStatus.text, widget.lobbyId);

          },
          child: const Text(
            "Change ready status",
          ),
        ),

        // Button to go back to the HomePage
        TextButton(
          onPressed: () {

            // socket?.emit(GameOnlineSocketEvent.quitLobby.text, socket.id);

            socket?.emit(GameOnlineSocketEvent.quitLobbyRequest.text, widget.gameOnlineLobbyModel.lobbyId);

            GlobalFunctions.redirectAndClearRootTree(
              MenuPage.route,
            );

          },
          child: const Text(
            "Go back to HomePage",
          ),
        ),

      ],
    );
  }

  @override
  void dispose() {

    // Cancel the timer on the widget's dispose
    _timer?.cancel();

    super.dispose();
  }

}
