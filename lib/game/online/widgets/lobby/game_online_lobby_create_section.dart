import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/models/game_online_socket_model.dart';
import 'package:tapit/game/online/providers/game_online_lobby_provider.dart';
import 'package:tapit/global/utils/global_functions.dart';
import 'package:tapit/global/utils/global_run_once.dart';
import 'package:tapit/menu/pages/menu_page.dart';

import '../../enums/socket_enums.dart';
import '../../../../global/providers/global_socket_provider.dart';
import '../../utils/game_online_text_styles.dart';

import 'package:socket_io_client/socket_io_client.dart' as socket_io;

import 'game_online_lobby_sockets_list.dart';

class GameOnlineLobbyCreateSection extends ConsumerStatefulWidget {

  final String lobbyId;

  const GameOnlineLobbyCreateSection({
    required this.lobbyId,
    super.key,
  });

  @override
  ConsumerState<GameOnlineLobbyCreateSection> createState() => _GameOnlineLobbyCreateSectionState();
}

class _GameOnlineLobbyCreateSectionState extends ConsumerState<GameOnlineLobbyCreateSection> {

  // Declaration of timer to execute periodically the getSocketsInfo's event
  Timer? _timer;

  // Initialization of utils class to execute a function only once
  final GlobalRunOnce _globalRunOnce = GlobalRunOnce();

  @override
  void initState() {

    // Getting the gameOnlineLobby state and notifier
    final onlineLobbyNotifier = ref.read(gameOnlineLobbyProvider.notifier);
    final List<GameOnlineSocketModel> onlineLobbyState = ref.read(gameOnlineLobbyProvider);

    // Getting the socket from the provider
    final Map socketProvider = ref.read(globalSocketProvider);
    final socket_io.Socket? socket = socketProvider["socket"];

    // Listening the getSocketsInfo's event from the server
    socket?.on(GameOnlineSocketEvent.getSocketsInfo.text, (dynamic data) {

      // Logging the event
      debugPrint("${GameOnlineSocketEvent.getSocketsInfo.text} event received, handling it...");

      // Getting the list of sockets' ids from the current state and from the server's data
      final List<String> connectedSocketIds = (data as List).map((item) => item as String).toList();
      final List<String> socketsIdsInState = onlineLobbyState.map((item) => item as String).toList();

      // Check if the lists of the sockets list have differences
      if (!listEquals(connectedSocketIds, socketsIdsInState)) {

        // If so, set the list that we got from the server as current state
        onlineLobbyNotifier.setSocketsList(connectedSocketIds);

      }

    });

    // Listening the setReadyStatus's event from the server
    socket?.on(GameOnlineSocketEvent.setReadyStatus.text, (dynamic data) {

      // Logging the event
      debugPrint("${GameOnlineSocketEvent.setReadyStatus.text} event received, handling it...");

      // Get the socket id from the server that have changed the ready status
      final String socketIdToChangeReadyStatus = data as String;

      // Change the ready status of the socket's that the server gave us
      onlineLobbyNotifier.setReadyStatus(socketIdToChangeReadyStatus);

    });

    // Declaration of the timer, execute the internal functions every 3 seconds
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {

      // Emit the getSocketsInfo's event to the server with the lobbyId
      socket?.emit(GameOnlineSocketEvent.getSocketsInfo.text, widget.lobbyId);

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // Getting the socket from the provider
    final Map socketProvider = ref.watch(globalSocketProvider);
    final socket_io.Socket? socket = socketProvider["socket"];

    // Use the GlobalRunOnce utils class to run the anonymous function only once
    _globalRunOnce.call(() {

      // Emit the initial getSocketsInfo's event before the timer start, so the player
      // doesn't see a 3 seconds long clear list of the sockets connected to the lobby
      socket?.emit(GameOnlineSocketEvent.getSocketsInfo.text, widget.lobbyId);

    });

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
          widget.lobbyId,
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
            socket?.emit(GameOnlineSocketEvent.setReadyStatus.text, widget.lobbyId);

          },
          child: const Text(
            "Change ready status",
          ),
        ),

        // Button to go back to the HomePage
        TextButton(
          onPressed: () {

            // Redirect the player to the Home page
            GlobalFunctions.redirectAndClearRootTree(
              context,
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
