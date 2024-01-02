import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/event_listeners/game/game_online_game_score_listener_mixin.dart';
import 'package:tapit/game/online/event_listeners/game/game_online_game_win_listener_mixin.dart';
import 'package:tapit/game/online/widgets/game/game_online_gesture_detectors.dart';
import 'package:tapit/game/online/widgets/game/game_online_player_containers.dart';

import '../../../global/providers/global_socket_provider.dart';
import '../event_listeners/player/game_online_player_change_listener_mixin.dart';
import '../widgets/game/game_online_container_indicators.dart';
import '../widgets/game/game_online_player_percentages.dart';

import 'package:socket_io_client/socket_io_client.dart' as socket_io;

class GameOnlinePage extends ConsumerStatefulWidget {

  static const String route = "/game-online-page";

  const GameOnlinePage({
    super.key,
  });

  @override
  ConsumerState<GameOnlinePage> createState() => _GameOnlinePageState();
}

class _GameOnlinePageState extends ConsumerState<GameOnlinePage> with
    GameOnlinePlayerChangeListenerMixin,
    GameOnlineGameScoreListenerMixin,
    GameOnlineGameWinListenerMixin {

  @override
  void initState() {

    super.initState();

    final socket_io.Socket socket = ref.read(globalSocketProvider).socket!;

    // Listening to the PLAYER STATUS CHANGE
    listenToPlayerChange(
      context: context,
      socket: socket,
      ref: ref,
      isInGame: true,
    );

    // Listening to the SCORE EVENT
    listenToGameScoreEvent(
      context: context,
      socket: socket,
      ref: ref,
    );

    // Listening to the WIN EVENT
    listenToGameWinEvent(
      context: context,
      socket: socket,
      ref: ref,
    );

  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [

          GameOnlinePlayersContainers(),

          GameOnlineContainerIndicators(),

          GameOnlinePlayersPercentages(),

          GameOnlineGestureDetectors(),

        ],
      ),
    );
  }

}
