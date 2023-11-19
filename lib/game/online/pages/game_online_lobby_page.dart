import 'package:flutter/material.dart';
import 'package:tapit/game/online/models/lobby/game_online_lobby_model.dart';

import '../widgets/lobby/game_online_lobby_create_section.dart';
import '../widgets/lobby/game_online_lobby_title.dart';

class GameOnlineLobbyPage extends StatefulWidget {

  static const String route = "/game-online-lobby-page";

  final GameOnlineLobbyModel gameOnlineLobbyModel;

  const GameOnlineLobbyPage({
    required this.gameOnlineLobbyModel,
    super.key,
  });

  @override
  State<GameOnlineLobbyPage> createState() => _GameOnlineLobbyPageState();
}

class _GameOnlineLobbyPageState extends State<GameOnlineLobbyPage> {

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

            GameOnlineLobbyCreateSection(
              gameOnlineLobbyModel: widget.gameOnlineLobbyModel,
            )

          ],
        ),
      ),
    );
  }

}
