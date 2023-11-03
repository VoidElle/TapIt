import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/pages/game_online_lobby_page.dart';
import 'package:tapit/game/online/utils/game_online_functions.dart';
import 'package:tapit/global/utils/global_functions.dart';
import 'package:tapit/menu/pages/menu_page.dart';

import '../../../global/utils/global_color_constants.dart';
import '../../../global/utils/global_text_styles.dart';
import '../../../global/widgets/global_animated_button.dart';
import '../enums/socket_enums.dart';
import '../providers/game_online_socket_provider.dart';
import '../widgets/menu/game_online_menu_title.dart';

import 'package:socket_io_client/socket_io_client.dart' as socket_io;

class GameOnlineMenuPage extends ConsumerStatefulWidget {

  static const String route = "/game-online-menu-page";

  const GameOnlineMenuPage({super.key});

  @override
  ConsumerState<GameOnlineMenuPage> createState() => _GameOnlineMenuPageState();
}

class _GameOnlineMenuPageState extends ConsumerState<GameOnlineMenuPage> {

  @override
  void initState() {
    super.initState();
    GameOnlineFunctions.initSocketConnection(ref);
  }

  @override
  Widget build(BuildContext context) {

    final double deviceHeight = MediaQuery.of(context).size.height;

    final Map socketProvider = ref.watch(gameOnlineSocketProvider);

    final GameOnlineSocketStatus gameOnlineSocketStatus = socketProvider["status"];
    GameOnlineFunctions.manageSocketStatusFromMenu(gameOnlineSocketStatus, context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            // The title section
            const GameOnlineMenuTitle(),

            SizedBox(
              height: deviceHeight / 15,
            ),

            GlobalAnimatedButton(
              onTapUp: () async {

                final socket_io.Socket? socket = socketProvider["socket"];

                if (socket != null) {
                  socket.emit(GameOnlineSocketEvent.createLobby.text);
                  socket.on(GameOnlineSocketEvent.createLobby.text, (dynamic data) {
                    Navigator.of(context).pushReplacementNamed(
                      GameOnlineLobbyPage.route,
                      arguments: {
                        "is_leader": true,
                        "lobby_id": data.toString(),
                      },
                    );
                  });
                }

              },
              child: AutoSizeText(
                "CREATE",
                maxLines: 1,
                style: GlobalTextStyles.buttonTextStyle(),
              ),
            ),

            SizedBox(
              height: deviceHeight / 25,
            ),

            GlobalAnimatedButton(
              onTapUp: () async {

                Navigator.of(context).pushReplacementNamed(
                  GameOnlineLobbyPage.route,
                  arguments: {
                    "is_leader": false,
                  },
                );

                // Show the dialog for getting the input of the lobby id
                /*final String? lobbyId = await showDialog(
                  context: context,
                  builder: (BuildContext _) => const GameOnlineJoinDialog(),
                );

                if (lobbyId != null && lobbyId.isNotEmpty) {
                  final socket_io.Socket? socket = socketProvider["socket"];
                  if (socket != null) {
                    socket.emit(GameOnlineSocketEvent.joinLobby.text, lobbyId);
                    socket.on(GameOnlineSocketEvent.joinSuccess.text, (_) {
                      Navigator.of(context).pushReplacementNamed(
                        GameOnlinePage.route,
                        arguments: {
                          "lobby_id": lobbyId,
                        },
                      );
                    });
                  }
                }*/

              },
              child: AutoSizeText(
                "JOIN",
                maxLines: 1,
                style: GlobalTextStyles.buttonTextStyle(),
              ),
            ),

            const SizedBox(
              height: 50,
            ),

            GlobalAnimatedButton.circular(
              child: const Padding(
                padding: EdgeInsets.only(
                  bottom: 10,
                ),
                child: Icon(
                  Icons.home,
                  color: GlobalColorConstants.kBlackColor,
                  size: 40,
                ),
              ),
              onTapUp: () => GlobalFunctions.redirectAndClearRootTree(context, MenuPage.route),
            ),

          ],
        ),
      ),
    );
  }

}
