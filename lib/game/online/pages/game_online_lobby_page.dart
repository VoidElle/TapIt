import 'package:flutter/material.dart';
import 'package:tapit/game/online/widgets/lobby/game_online_lobby_join_section.dart';

import '../widgets/lobby/game_online_lobby_create_section.dart';
import '../widgets/lobby/game_online_lobby_title.dart';

class GameOnlineLobbyPage extends StatelessWidget {

  static const String route = "/game-online-lobby-page";

  final bool isLeader;
  final String? lobbyId;

  const GameOnlineLobbyPage({
    required this.isLeader,
    required this.lobbyId,
    super.key,
  });

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
              height: deviceHeight / 15,
            ),

            isLeader
                ? GameOnlineLobbyCreateSection(
                    lobbyId: lobbyId!,
                  )
                : const GameOnlineLobbyJoinSection(),

          ],
        ),
      ),
    );
  }

}
