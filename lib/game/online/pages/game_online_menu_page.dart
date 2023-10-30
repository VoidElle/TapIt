import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:tapit/game/online/dialogs/game_online_join_dialog.dart';
import 'package:tapit/game/online/utils/game_online_functions.dart';

import '../../../global/utils/global_text_styles.dart';
import '../../../global/widgets/global_animated_button.dart';
import '../providers/game_online_socket_provider.dart';
import '../widgets/lobby/game_online_lobby_title.dart';

class GameOnlineMenuPage extends ConsumerWidget {

  static const String route = "/game-online-menu-page";

  const GameOnlineMenuPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final double deviceHeight = MediaQuery.of(context).size.height;

    GameOnlineFunctions.manageSocketStatus(context, ref);

    return Scaffold(
      body: Column(
        children: [

          // The title section
          const GameOnlineLobbyTitle(),

          Text(
            ref.watch(gameOnlineSocketNotifierProvider)["status"].toString(),
          ),

          SizedBox(
            height: deviceHeight / 15,
          ),

          GlobalAnimatedButton(
            onTapUp: () async {

              // Invoke the function to create a lobby on the server
              final String lobbyId = await GameOnlineFunctions.createLobby(context, ref);

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
