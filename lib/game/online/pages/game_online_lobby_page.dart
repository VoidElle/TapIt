import 'package:flutter/material.dart';
import 'package:tapit/game/online/widgets/lobby/game_online_lobby_join_section.dart';

import '../widgets/lobby/game_online_lobby_create_section.dart';
import '../widgets/lobby/game_online_lobby_title.dart';

class GameOnlineLobbyPage extends StatefulWidget {

  static const String route = "/game-online-lobby-page";

  final bool isJoined;
  final String? lobbyId;

  const GameOnlineLobbyPage({
    required this.isJoined,
    required this.lobbyId,
    super.key,
  });

  @override
  State<GameOnlineLobbyPage> createState() => _GameOnlineLobbyPageState();
}

class _GameOnlineLobbyPageState extends State<GameOnlineLobbyPage> {

  late bool _isJoined;
  late String _lobbyId;

  @override
  void initState() {
    super.initState();
    _isJoined = widget.isJoined;
    _lobbyId = widget.lobbyId ?? "";
  }

  // Function to change the status of joining inside the lobby state
  void _changeJoinedStatus(String lobbyId) {
    setState(() {
      _isJoined = true;
      _lobbyId = lobbyId;
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
                    lobbyId: _lobbyId,
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
