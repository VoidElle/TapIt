import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/dialogs/game_online_leader_left_dialog.dart';
import 'package:tapit/game/online/models/lobby/game_online_lobby_model.dart';
import 'package:tapit/game/online/models/socket/game_online_socket_model.dart';
import 'package:tapit/game/online/pages/game_online_page.dart';
import 'package:tapit/game/online/providers/game_online_lobby_provider.dart';
import 'package:tapit/game/online/utils/game_online_functions.dart';
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

  @override
  void initState() {

    // Getting the gameOnlineLobby state and notifier
    final onlineLobbyNotifier = ref.read(gameOnlineLobbyProvider.notifier);
    onlineLobbyNotifier.setSocketsList(widget.gameOnlineLobbyModel.sockets, notify: false);

    // Getting the socket from the provider
    final Map socketProvider = ref.read(globalSocketProvider);
    final socket_io.Socket? socket = socketProvider["socket"];

    // Listening to the join success event
    socket?.on(GameOnlineSocketEvent.joinLobbyResponseSuccess.text, (dynamic data) {
      if (mounted && data != null) {

        // Creating a GameOnlineLobby model and setting the list using the notifier
        final GameOnlineLobbyModel gameOnlineLobbyModel = GameOnlineLobbyModel.fromJson(data);
        onlineLobbyNotifier.setSocketsList(gameOnlineLobbyModel.sockets);

      }
    });

    // Listening to the quit lobby success event
    // when a socket quits the lobby
    socket?.on(GameOnlineSocketEvent.quitLobbyResponseSuccess.text, (dynamic data) {
      if (mounted && data != null) {

        // Get the id of the left socket
        final Map<String, dynamic> json = data as Map<String, dynamic>;
        final String socketId = json["quittedSocket"];

        // Remove the left socket from the list
        onlineLobbyNotifier.removeSocketFromList(socketId);
        onlineLobbyNotifier.resetReadyStatus();

      }
    });

    // Listening to the leader left lobby event
    socket?.on(GameOnlineSocketEvent.leaderLeftLobby.text, (dynamic data) {
      if (mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext _) => const GameOnlineLeaderLeftDialog(),
        );
      }
    });

    socket?.on(GameOnlineSocketEvent.playerChangeReadyStatus.text, (dynamic data) {
      if (mounted && data != null) {

        final Map<String, dynamic> json = data as Map<String, dynamic>;
        final String socketId = json["socket"];

        onlineLobbyNotifier.changeReadyStatus(socketId);

      }
    });

    socket?.on(GameOnlineSocketEvent.startLobbyResponseSuccess.text, (dynamic data) {
      if (mounted) {
        GlobalFunctions.redirectAndClearRootTree(GameOnlinePage.route);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // Getting the state of the lobby from the provider
    final onlineLobbyState = ref.watch(gameOnlineLobbyProvider);
    final onlineLobbyNotifier = ref.read(gameOnlineLobbyProvider.notifier);

    // Getting the socket from the provider
    final Map socketProvider = ref.watch(globalSocketProvider);
    final socket_io.Socket? socket = socketProvider["socket"];

    final int sizeOfConnectedSockets = onlineLobbyNotifier.getNumberOfConnectedSockets();
    final GameOnlineSocketModel? gameOnlineSocketModel = onlineLobbyNotifier.getSocket(socket?.id);

    // Check if all the sockets are ready
    final bool areAllSocketsReady = GameOnlineFunctions.areAllSocketsReady(onlineLobbyState);

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
            leaderSocket: socket.id ?? "",
          ),

        if (areAllSocketsReady && sizeOfConnectedSockets > 1 && gameOnlineSocketModel != null && gameOnlineSocketModel.isLeader)
          TextButton(
            onPressed: () {
              socket?.emit(GameOnlineSocketEvent.startLobbyRequest.text, widget.gameOnlineLobbyModel.lobbyId);
            },
            child: const Text(
              "Start the Game",
            ),
          ),

        // Button to change the status of the socket
        TextButton(
          onPressed: () {

            // Emit the setReadyStatus' event to the server with the lobby id
            socket?.emit(GameOnlineSocketEvent.playerChangeReadyStatus.text, widget.gameOnlineLobbyModel.lobbyId);

          },
          child: const Text(
            "Change ready status",
          ),
        ),

        // Button to go back to the HomePage
        TextButton(
          onPressed: () {

            // Emit the quit lobby event
            socket?.emit(GameOnlineSocketEvent.quitLobbyRequest.text, widget.gameOnlineLobbyModel.lobbyId);

            // Redirect the user to the MenuPage
            GlobalFunctions.redirectAndClearRootTree(MenuPage.route);

          },
          child: const Text(
            "Go back to HomePage",
          ),
        ),

      ],
    );
  }

}
