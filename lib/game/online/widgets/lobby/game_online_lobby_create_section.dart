import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  List<String> _sockets = [];

  Widget _buildSocketsList() {
    return Column(
      children: [

        for (String socket in _sockets)
          Text(
            socket,
          ),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    final Map socketProvider = ref.watch(gameOnlineSocketProvider);
    final socket_io.Socket? socket = socketProvider["socket"];

    if (socket != null) {

      socket.on(GameOnlineSocketEvent.getSocketsInfo.text, (dynamic data) {
        final List<String> socketsList = data;
        if (!listEquals(socketsList, _sockets)) {
          setState(() => _sockets = socketsList);
        }
      });

      Timer.periodic(const Duration(seconds: 3), (_) {
        socket.emit(GameOnlineSocketEvent.getSocketsInfo.text, widget.lobbyId);
      });

    }

    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: AutoSizeText(
            "Hello, share with your friend the code below to join this lobby",
            textAlign: TextAlign.center,
            maxLines: 2,
            style: GameOnlineTextStyles.lobbyInstructionTextStyle(),
          ),
        ),

        Text(
          widget.lobbyId,
          style: GameOnlineTextStyles.lobbyCodeTextStyle(),
        ),

        _buildSocketsList(),

      ],
    );
  }
}
