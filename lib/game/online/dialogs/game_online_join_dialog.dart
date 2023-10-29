import 'package:flutter/material.dart';
import 'package:tapit/game/online/utils/game_online_functions.dart';

class GameOnlineJoinDialog extends StatefulWidget {

  const GameOnlineJoinDialog({super.key});

  @override
  State<GameOnlineJoinDialog> createState() => _GameOnlineJoinDialogState();
}

class _GameOnlineJoinDialogState extends State<GameOnlineJoinDialog> {

  String _lobbyId = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Join",
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          TextField(
            maxLines: 1,
            onChanged: (String newLobbyId) {
              _lobbyId = newLobbyId;
            },
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              elevation: 0,
            ),
            onPressed: () {
              GameOnlineFunctions.joinLobby(_lobbyId);
            },
            child: const Text(
              "Join",
            ),
          ),

        ],
      ),
    );
  }

}