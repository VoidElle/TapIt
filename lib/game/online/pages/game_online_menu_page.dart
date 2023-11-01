import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/dialogs/game_online_join_dialog.dart';
import 'package:tapit/game/online/utils/game_online_functions.dart';
import 'package:tapit/global/utils/global_functions.dart';
import 'package:tapit/menu/pages/menu_page.dart';

import '../../../global/utils/global_color_constants.dart';
import '../../../global/utils/global_text_styles.dart';
import '../../../global/widgets/global_animated_button.dart';
import '../providers/game_online_socket_provider.dart';
import '../widgets/lobby/game_online_lobby_title.dart';

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
      body: Column(
        children: [

          // The title section
          const GameOnlineLobbyTitle(),

          SizedBox(
            height: deviceHeight / 15,
          ),

          GlobalAnimatedButton(
            onTapUp: () async {

              // Invoke the function to create a lobby on the server
              final String lobbyId = await GameOnlineFunctions.createLobby();

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

              // Show the dialog for getting the input of the lobby id
              showDialog(
                context: context,
                builder: (BuildContext _) => const GameOnlineJoinDialog(),
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
            onTapUp: () => GlobalFunctions.redirectAndClearRootTree(context, MenuPage.route),
          ),

        ],
      ),
    );
  }
}
