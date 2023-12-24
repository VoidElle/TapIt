import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/widgets/game/game_online_gesture_detectors.dart';
import 'package:tapit/game/online/widgets/game/game_online_player_containers.dart';

import '../../../global/providers/global_socket_provider.dart';
import '../event_listeners/player/game_online_player_change_listener_mixin.dart';
import '../widgets/game/game_online_container_indicators.dart';
import '../widgets/game/game_online_player_percentages.dart';

class GameOnlinePage extends ConsumerStatefulWidget {

  static const String route = "/game-online-page";

  const GameOnlinePage({
    super.key,
  });

  @override
  ConsumerState<GameOnlinePage> createState() => _GameOnlinePageState();
}

class _GameOnlinePageState extends ConsumerState<GameOnlinePage> with GameOnlinePlayerChangeListenerMixin {

  @override
  void initState() {

    super.initState();

    listenToPlayerChange(
      context: context,
      socket: ref.read(globalSocketProvider).socket,
      ref: ref,
      isInGame: true,
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
