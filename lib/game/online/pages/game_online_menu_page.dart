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

    // Initialization of the socket connection (Connect with the Server)
    GameOnlineFunctions.initSocketConnection(ref);

    // Getting the socket from the provider
    final Map socketProvider = ref.read(gameOnlineSocketProvider);
    final socket_io.Socket? socket = socketProvider["socket"];

    // Listening to the CreateLobby event
    socket?.on(GameOnlineSocketEvent.createLobby.text, (dynamic data) {

      // Redirect the player to the lobby page as leader
      GlobalFunctions.redirectAndClearRootTree(
        context,
        GameOnlineLobbyPage.route,
        arguments: {
          "is_joined": true,
          "lobby_id": data.toString(),
        },
      );

    });

  }

  @override
  Widget build(BuildContext context) {

    // Getting the device's height
    final double deviceHeight = MediaQuery.of(context).size.height;

    // Getting the socket and the socket's status from the provider
    final Map socketProvider = ref.watch(gameOnlineSocketProvider);
    final socket_io.Socket? socket = socketProvider["socket"];
    final GameOnlineSocketStatus gameOnlineSocketStatus = socketProvider["status"];

    // Managing socket's status
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
              onTapUp: () {

                // Emitting the CreateLobby event to the server
                socket?.emit(GameOnlineSocketEvent.createLobby.text);

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
              onTapUp: () {

                // Redirect the player to the Lobby page as NOT leader
                GlobalFunctions.redirectAndClearRootTree(
                  context,
                  GameOnlineLobbyPage.route,
                  arguments: {
                    "is_joined": false,
                  },
                );

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
              onTapUp: () {

                // Redirecting the player to the Menu Page
                GlobalFunctions.redirectAndClearRootTree(
                  context,
                  MenuPage.route,
                );

              },
            ),

          ],
        ),
      ),
    );
  }

}
