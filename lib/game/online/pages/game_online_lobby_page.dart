import 'package:flutter/material.dart';
import 'package:tapit/game/online/models/game_online_lobby_model.dart';
import 'package:tapit/game/online/widgets/lobby/game_online_lobby_join_section.dart';

import '../widgets/lobby/game_online_lobby_create_section.dart';
import '../widgets/lobby/game_online_lobby_title.dart';

class GameOnlineLobbyPage extends StatefulWidget {

  static const String route = "/game-online-lobby-page";

  final GameOnlineLobbyModel? gameOnlineLobbyModel;

  const GameOnlineLobbyPage({
    required this.gameOnlineLobbyModel,
    super.key,
  });

  @override
  State<GameOnlineLobbyPage> createState() => _GameOnlineLobbyPageState();
}

class _GameOnlineLobbyPageState extends State<GameOnlineLobbyPage> {

  late bool _isJoined;

  @override
  void initState() {
    super.initState();
    _isJoined = widget.gameOnlineLobbyModel != null;
  }

  // Function to change the status of joining inside the lobby state
  void _changeJoinedStatus(String lobbyId) {
    setState(() {
      _isJoined = true;
    });
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

            _isJoined
                ? GameOnlineLobbyCreateSection(
                    gameOnlineLobbyModel: widget.gameOnlineLobbyModel!,
                  )
                : GameOnlineLobbyJoinSection(
                    changeJoinedStatus: _changeJoinedStatus,
                  ),
          ],
        ),
      ),
    );
  }
}
