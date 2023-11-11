import 'package:flutter/material.dart';

import '../widgets/lobby/game_online_lobby_join_section.dart';
import '../widgets/lobby/game_online_lobby_title.dart';

class GameOnlineJoinLobbyPage extends StatelessWidget {

  static const String route = "/game-online-join-lobby-page";

  const GameOnlineJoinLobbyPage({super.key});

  @override
  Widget build(BuildContext context) {

    final double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            // The title section
            const GameOnlineLobbyTitle(),

            SizedBox(
              height: deviceHeight / 25,
            ),

            const GameOnlineLobbyJoinSection(),

          ],
        ),
      ),
    );
  }

}
