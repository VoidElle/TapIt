import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/models/game/game_online_game_model.dart';
import 'package:tapit/game/online/providers/game_online_game_provider.dart';
import 'package:tapit/game/online/widgets/game/game_online_player_containers.dart';

class GameOnlinePage extends ConsumerStatefulWidget {

  static const String route = "/game-online-page";

  final GameOnlineGameModel gameModel;

  const GameOnlinePage({
    required this.gameModel,
    super.key,
  });

  @override
  ConsumerState<GameOnlinePage> createState() => _GameOnlinePageState();
}

class _GameOnlinePageState extends ConsumerState<GameOnlinePage> {

  @override
  void initState() {

    final gameOnlineNotifier = ref.read(gameOnlineGameProvider.notifier);
    gameOnlineNotifier.setGameModel(widget.gameModel, notify: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [

          GameOnlinePlayersContainers(),

        ],
      ),
    );
  }

}
