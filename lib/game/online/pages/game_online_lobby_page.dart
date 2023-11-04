import 'package:flutter/material.dart';
import 'package:tapit/game/online/widgets/lobby/game_online_lobby_join_section.dart';

import '../widgets/lobby/game_online_lobby_create_section.dart';
import '../widgets/lobby/game_online_lobby_title.dart';

class GameOnlineLobbyPage extends StatefulWidget {

  static const String route = "/game-online-lobby-page";

  final bool isLeader;
  final String? lobbyId;

  const GameOnlineLobbyPage({
    required this.isLeader,
    required this.lobbyId,
    super.key,
  });

  @override
  State<GameOnlineLobbyPage> createState() => _GameOnlineLobbyPageState();
}

class _GameOnlineLobbyPageState extends State<GameOnlineLobbyPage> {

  late bool _isLeader;
  late String _lobbyId;

  @override
  void initState() {
    super.initState();
    _isLeader = widget.isLeader;
    _lobbyId = widget.lobbyId ?? "";
  }

  // Function to show the same widgets of the leader
  // to the player that joined a room
  void _changeLeaderFunction(String lobbyId) {
    setState(() {
      _isLeader = true;
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

            // Todo: Find a new way to dynamically render the different widget
            _isLeader
                ? GameOnlineLobbyCreateSection(
                    lobbyId: _lobbyId,
                  )
                : GameOnlineLobbyJoinSection(
                    changeLeaderFunction: _changeLeaderFunction,
                  ),
          ],
        ),
      ),
    );
  }
}
