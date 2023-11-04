import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/models/game_online_socket_model.dart';
import 'package:tapit/game/online/providers/game_online_lobby_provider.dart';
import 'package:tapit/global/utils/global_run_once.dart';
import 'package:tapit/menu/pages/menu_page.dart';

import '../../../../global/utils/global_color_constants.dart';
import '../../enums/socket_enums.dart';
import '../../providers/game_online_socket_provider.dart';
import '../../utils/game_online_text_styles.dart';

import 'package:socket_io_client/socket_io_client.dart' as socket_io;

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

  Timer? _timer;
  final GlobalRunOnce _globalRunOnce = GlobalRunOnce();

  Widget _buildSocketsList(String leaderSocket) {
    final List<GameOnlineSocketModel> onlineLobbyProvider = ref.watch(gameOnlineLobbyProvider);
    return Column(
      children: [

        for (GameOnlineSocketModel socket in onlineLobbyProvider)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                socket.socketId,
              ),

              if (socket.socketId == leaderSocket)
                const Text(
                  " (You)"
                ),

              const SizedBox(
                width: 5,
              ),

              _buildReadyStatusCircular(socket.readyStatus),

            ],
          ),

      ],
    );
  }

  Widget _buildReadyStatusCircular(bool readyStatus) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: readyStatus
            ? GlobalColorConstants.kGreenColor
            : GlobalColorConstants.kRedColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
    );
  }

  @override
  void initState() {

    final onlineLobbyNotifier = ref.read(gameOnlineLobbyProvider.notifier);
    final List<GameOnlineSocketModel> onlineLobbyState = ref.read(gameOnlineLobbyProvider);

    final Map socketProvider = ref.read(gameOnlineSocketProvider);

    final socket_io.Socket? socket = socketProvider["socket"];

    socket?.on(GameOnlineSocketEvent.getSocketsInfo.text, (dynamic data) {

      debugPrint("${GameOnlineSocketEvent.getSocketsInfo.text} event received, handling it...");

      final List<String> connectedSocketIds = (data as List).map((item) => item as String).toList();
      final List<String> socketsIdsInState = onlineLobbyState.map((item) => item as String).toList();

      if (!listEquals(connectedSocketIds, socketsIdsInState)) {
        onlineLobbyNotifier.setSocketsList(connectedSocketIds);
      }

    });

    socket?.on(GameOnlineSocketEvent.setReadyStatus.text, (dynamic data) {
      final String socketIdToChangeReadyStatus = data as String;
      debugPrint("${GameOnlineSocketEvent.setReadyStatus.text} event received, handling it...");
      onlineLobbyNotifier.setReadyStatus(socketIdToChangeReadyStatus);
    });

    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      socket?.emit(GameOnlineSocketEvent.getSocketsInfo.text, widget.lobbyId);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final Map socketProvider = ref.watch(gameOnlineSocketProvider);
    final socket_io.Socket? socket = socketProvider["socket"];

    _globalRunOnce.call(() {
      socket?.emit(GameOnlineSocketEvent.getSocketsInfo.text, widget.lobbyId);
    });

    return Column(
      children: [

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

        Text(
          widget.lobbyId,
          style: GameOnlineTextStyles.lobbyCodeTextStyle(),
        ),

        if (socket != null)
          _buildSocketsList(socket.id!),

        TextButton(
          onPressed: () {
            socket?.emit(GameOnlineSocketEvent.setReadyStatus.text, widget.lobbyId);
          },
          child: const Text(
            "Change ready status",
          ),
        ),

        TextButton(
          onPressed: () => Navigator.of(context).pushReplacementNamed(MenuPage.route),
          child: const Text(
            "Go back to HomePage",
          ),
        ),

      ],
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

}
