import 'package:flutter/material.dart';

import '../widgets/game_local_player_containers.dart';

class GameLocalPage extends StatelessWidget {

  static const String route = "/game-local-page";

  const GameLocalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [

          GameLocalPlayersContainers(),

          // GameLocalPlayersPercentages(),

          // GameLocalReadyButtons(),

          // GameLocalCountDown(),

          // GameLocalGestureDetectors(),

        ],
      ),
    );
  }

}
