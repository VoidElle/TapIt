import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/models/game/game_online_game_model.dart';
import 'package:tapit/game/online/providers/game_online_game_provider.dart';
import 'package:tapit/game/online/widgets/game/game_online_gesture_detectors.dart';
import 'package:tapit/game/online/widgets/game/game_online_player_containers.dart';

import '../../../global/models/global_socket_model.dart';
import '../../../global/providers/global_socket_provider.dart';

import 'package:socket_io_client/socket_io_client.dart' as socket_io;

import '../enums/socket_enums.dart';
import '../widgets/game/game_online_container_indicators.dart';

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

    final GlobalSocketModel socketProvider = ref.read(globalSocketProvider);
    final socket_io.Socket? socket = socketProvider.socket;

    socket?.on(GameOnlineSocketEvent.gameScore.text, (dynamic data) {
      if (mounted && data != null) {

        final String idSent = data;

        debugPrint("$idSent SCORED");

      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [

          GameOnlinePlayersContainers(),

          GameOnlineContainerIndicators(),

          GameOnlineGestureDetectors(),

        ],
      ),
    );
  }

}
