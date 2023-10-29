import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/dialogs/game_online_join_dialog.dart';
import 'package:tapit/game/online/pages/game_online_page.dart';
import 'package:tapit/game/online/utils/game_online_functions.dart';
import 'package:tapit/global/utils/global_constants.dart';

import '../../../global/utils/global_text_styles.dart';
import '../../../global/widgets/global_animated_button.dart';
import '../providers/game_online_socket_provider.dart';
import '../widgets/lobby/game_online_lobby_title.dart';

class GameOnlineLobbyPage extends ConsumerWidget {

  static const String route = "/game-online-lobby-page";

  const GameOnlineLobbyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final Map socketState = ref.watch(gameOnlineSocketNotifierProvider);
    final GameOnlineSocketProviderStatusEnum socketStatus = socketState["status"];

    final double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [

          // The title section
          const GameOnlineLobbyTitle(),

          Text(
            socketStatus.toString(),
          ),

          SizedBox(
            height: deviceHeight / 15,
          ),

          GlobalAnimatedButton(
            onTapUp: () async {

              // Invoke the function to create a lobby on the server
              await GameOnlineFunctions.createLobby(context, ref);

              // If the connection of the socket with the server is success,
              // redirect the player to the online game's page
              if (socketStatus == GameOnlineSocketProviderStatusEnum.success) {
                if (context.mounted) {
                  Navigator.of(context).pushNamed(GameOnlinePage.route);
                } else {
                  debugPrint(GlobalConstants.navigationWithContextNotMounted);
                }
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

        ],
      ),
    );
  }

}
