import 'package:flutter/material.dart';
import 'package:tapit/game/online/models/game/game_online_game_model.dart';

class GameOnlinePage extends StatelessWidget {

  static const String route = "/game-online-page";

  final GameOnlineGameModel gameModel;

  const GameOnlinePage({
    required this.gameModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    debugPrint(gameModel.toString());

    return const Scaffold();
  }

}
