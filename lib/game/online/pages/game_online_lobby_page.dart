import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/models/lobby/game_online_lobby_model.dart';

import '../providers/game_online_lobby_provider.dart';
import '../widgets/lobby/game_online_lobby_create_section.dart';
import '../widgets/lobby/game_online_lobby_title.dart';

class GameOnlineLobbyPage extends ConsumerStatefulWidget {

  static const String route = "/game-online-lobby-page";

  final GameOnlineLobbyModel gameOnlineLobbyModel;

  const GameOnlineLobbyPage({
    required this.gameOnlineLobbyModel,
    super.key,
  });

  @override
  ConsumerState<GameOnlineLobbyPage> createState() => _GameOnlineLobbyPageState();
}

class _GameOnlineLobbyPageState extends ConsumerState<GameOnlineLobbyPage> {

  @override
  void initState() {

    // Set the lobby model to the provider
    final onlineLobbyNotifier = ref.read(gameOnlineLobbyProvider.notifier);
    onlineLobbyNotifier.setStateSilent(widget.gameOnlineLobbyModel);

    super.initState();
  }

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

            const GameOnlineLobbyCreateSection(),

          ],
        ),
      ),
    );
  }

}
