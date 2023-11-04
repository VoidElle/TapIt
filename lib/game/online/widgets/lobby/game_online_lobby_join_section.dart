import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../menu/pages/menu_page.dart';
import '../../enums/socket_enums.dart';
import '../../providers/game_online_socket_provider.dart';
import '../../utils/game_online_text_styles.dart';

import 'package:socket_io_client/socket_io_client.dart' as socket_io;

class GameOnlineLobbyJoinSection extends ConsumerStatefulWidget {

  const GameOnlineLobbyJoinSection({super.key});

  @override
  ConsumerState<GameOnlineLobbyJoinSection> createState() => _GameOnlineLobbyJoinSectionState();
}

class _GameOnlineLobbyJoinSectionState extends ConsumerState<GameOnlineLobbyJoinSection> {

  String? _value;

  @override
  Widget build(BuildContext context) {

    final Map socketProvider = ref.watch(gameOnlineSocketProvider);

    return Column(
      children: [

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

              final socket_io.Socket? socket = socketProvider["socket"];

              if (socket != null) {

                socket.emit(GameOnlineSocketEvent.joinLobby.text, _value);

                socket.on(GameOnlineSocketEvent.joinSuccess.text, (_) {
                  debugPrint("JOIN LOBBY SUCCESS");
                });

                socket.on(GameOnlineSocketEvent.joinFail.text, (_) {
                  debugPrint("JOIN LOBBY ERROR");
                });

              }

            }
          },
          child: const Text(
            "JOIN",
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
}
