import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/models/lobby/game_online_lobby_model.dart';
import 'package:tapit/game/online/pages/game_online_join_lobby_page.dart';
import 'package:tapit/game/online/pages/game_online_lobby_page.dart';
import 'package:tapit/game/online/utils/game_online_functions.dart';
import 'package:tapit/global/models/global_socket_model.dart';
import 'package:tapit/global/utils/global_functions.dart';
import 'package:tapit/menu/pages/menu_page.dart';

import '../../../global/utils/global_color_constants.dart';
import '../../../global/utils/global_text_styles.dart';
import '../../../global/widgets/global_animated_button.dart';
import '../enums/socket_enums.dart';
import '../../../global/providers/global_socket_provider.dart';
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

    // Getting the socket notifier pre initialization
    final socketNotifierPreInitialization = ref.read(globalSocketProvider.notifier);

    // Initialization of the socket connection if it hasn't been initialized yet
    // (Connect with the Server)
    if (!socketNotifierPreInitialization.isSocketInitialized()) {
      GameOnlineFunctions.initSocketConnection(ref);
    }

    // Getting the socket from the provider
    final GlobalSocketModel socketProvider = ref.read(globalSocketProvider);
    final socket_io.Socket? socket = socketProvider.socket;

    // Listening to the create lobby success event
    socket?.on(GameOnlineSocketEvent.createLobbyResponseSuccess.text, (dynamic data) {
      if (mounted && data != null) {

        // Create the GameOnlineLobby model from the data received
        debugPrint("Lobby created: ${data.toString()}");
        final GameOnlineLobbyModel gameOnlineLobbyModel = GameOnlineLobbyModel.fromJson(data);

        // Redirect the use to the Lobby page with the
        // GameOnlineLobby model as an argument
        GlobalFunctions.redirectAndClearRootTree(
          GameOnlineLobbyPage.route,
          arguments: {
            "data": gameOnlineLobbyModel,
          },
        );

      }
    });

  }

  @override
  Widget build(BuildContext context) {

    // Getting the device's height
    final double deviceHeight = MediaQuery.of(context).size.height;

    // Getting the socket and the socket's status from the provider
    final GlobalSocketModel socketProvider = ref.watch(globalSocketProvider);
    final socket_io.Socket? socket = socketProvider.socket;
    final GameOnlineSocketStatus gameOnlineSocketStatus = socketProvider.gameOnlineSocketStatus;

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
                socket?.emit(GameOnlineSocketEvent.createLobbyRequest.text);

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

                // Redirecting the user to the Join lobby page
                GlobalFunctions.redirectAndClearRootTree(GameOnlineJoinLobbyPage.route);

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
                GlobalFunctions.redirectAndClearRootTree(MenuPage.route);

              },
            ),

          ],
        ),
      ),
    );
  }

}
