import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/global/utils/global_functions.dart';

import '../../../../menu/pages/menu_page.dart';
import '../../enums/socket_enums.dart';
import '../../../../global/providers/global_socket_provider.dart';
import '../../models/game_online_lobby_model.dart';
import '../../utils/game_online_text_styles.dart';

import 'package:socket_io_client/socket_io_client.dart' as socket_io;

class GameOnlineLobbyJoinSection extends ConsumerStatefulWidget {

  final Function(GameOnlineLobbyModel gameOnlineLobbyModel) changeJoinedStatus;

  const GameOnlineLobbyJoinSection({
    required this.changeJoinedStatus,
    super.key,
  });

  @override
  ConsumerState<GameOnlineLobbyJoinSection> createState() => _GameOnlineLobbyJoinSectionState();
}

class _GameOnlineLobbyJoinSectionState extends ConsumerState<GameOnlineLobbyJoinSection> {

  // Id of the lobby we want to join
  String? _value;

  @override
  void initState() {

    // Getting the socket from the provider
    final Map socketProvider = ref.read(globalSocketProvider);
    final socket_io.Socket? socket = socketProvider["socket"];

    socket?.on(GameOnlineSocketEvent.joinLobbyResponseSuccess.text, (dynamic data) {
      final GameOnlineLobbyModel gameOnlineLobbyModel = GameOnlineLobbyModel.fromJson(data);
      widget.changeJoinedStatus(gameOnlineLobbyModel);
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

        // Text
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: AutoSizeText(
            "Insert the lobby id that the friend shared you",
            textAlign: TextAlign.center,
            maxLines: 2,
            style: GameOnlineTextStyles.lobbyInstructionTextStyle(),
          ),
        ),

        // Form field for input of the lobby id to join
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: TextFormField(
            onChanged: (String? value) {
              _value = value;
            },
          ),
        ),

        TextButton(
          onPressed: () {
            if (_value != null) {

              // If the value is not null, send the event JoinLobby
              // to the server with the lobby id
              socket?.emit(GameOnlineSocketEvent.joinLobbyRequest.text, _value);

            }
          },
          child: const Text(
            "JOIN",
          ),
        ),

        TextButton(
          onPressed: () {

            // Redirect the player to the HomePage
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
}
