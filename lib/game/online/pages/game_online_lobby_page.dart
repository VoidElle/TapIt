import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../global/widgets/global_animated_button.dart';
import '../../../menu/utils/menu_text_styles.dart';
import '../widgets/lobby/game_online_lobby_title.dart';

class GameOnlineLobbyPage extends StatelessWidget {

  static const String route = "/game-online-lobby-page";

  const GameOnlineLobbyPage({super.key});

  @override
  Widget build(BuildContext context) {

    final double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [

          // The title section
          const GameOnlineLobbyTitle(),

          SizedBox(
            height: deviceHeight / 15,
          ),

          GlobalAnimatedButton(
            onTapUp: () {
              // Todo
            },
            child: AutoSizeText(
              "CREATE",
              maxLines: 1,
              style: MenuTextStyles.buttonTextStyle(),
            ),
          ),

          SizedBox(
            height: deviceHeight / 25,
          ),

          GlobalAnimatedButton(
            onTapUp: () {
              // Todo
            },
            child: AutoSizeText(
              "JOIN",
              maxLines: 1,
              style: MenuTextStyles.buttonTextStyle(),
            ),
          ),

        ],
      ),
    );
  }

}
