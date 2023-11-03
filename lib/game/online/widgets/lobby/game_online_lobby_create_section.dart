import 'package:flutter/material.dart';

class GameOnlineLobbyCreateSection extends StatelessWidget {

  final String lobbyId;

  const GameOnlineLobbyCreateSection({
    required this.lobbyId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "LOBBY_LEADER"
    );
  }

}
