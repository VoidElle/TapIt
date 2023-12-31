import 'package:flutter/material.dart';

import '../../../global/event_listeners/background_listener_mixin.dart';
import '../widgets/game_local_count_down.dart';
import '../widgets/game_local_gesture_detectors.dart';
import '../widgets/game_local_player_percentages.dart';
import '../widgets/game_local_ready_buttons.dart';
import '../widgets/game_local_player_containers.dart';
import '../widgets/game_local_win_confetti.dart';

class GameLocalPage extends StatefulWidget {

  static const String route = "/game-local-page";

  const GameLocalPage({super.key});

  @override
  State<GameLocalPage> createState() => _GameLocalPageState();
}

class _GameLocalPageState extends State<GameLocalPage> with WidgetsBindingObserver, BackgroundListenerMixin<GameLocalPage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [

          GameLocalPlayersContainers(),

          GameLocalPlayersPercentages(),

          GameLocalCountDown(),

          GameLocalWinConfetti(),

          GameLocalGestureDetectors(),

          GameLocalReadyButtons(),

        ],
      ),
    );
  }

}
