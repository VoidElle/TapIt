import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tapit/game/online/providers/game_online_game_provider.dart';
import 'package:tapit/global/widgets/global_custom_rounded_circle.dart';

import '../../../../../global/providers/global_socket_provider.dart';
import '../../../../../global/utils/global_color_constants.dart';
import '../../../../../global/utils/global_paths.dart';
import '../../../../../global/widgets/stroke_text.dart';
import '../../event_listeners/player/game_online_player_change_listener_mixin.dart';
import '../../models/player/game_online_player_model.dart';

class NewGameOnlineLobbyPlayersList extends ConsumerStatefulWidget {

  const NewGameOnlineLobbyPlayersList({super.key});

  @override
  ConsumerState<NewGameOnlineLobbyPlayersList> createState() => _NewGameOnlineLobbyPlayersListState();
}

class _NewGameOnlineLobbyPlayersListState extends ConsumerState<NewGameOnlineLobbyPlayersList> with GameOnlinePlayerChangeListenerMixin {

  @override
  void initState() {

    super.initState();

    listenToPlayerChange(
      context: context,
      socket: ref.read(globalSocketProvider).socket,
      ref: ref,
    );

  }

  @override
  Widget build(BuildContext context) {

    final List<GameOnlinePlayerModel> players = ref.watch(gameOnlineGameProvider).players;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: players.map(
            (GameOnlinePlayerModel player) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                GlobalCustomRoundedCircle(
                  height: 35,
                  width: 35,
                  strokeWidth: 3.5,
                  color: player.readyStatus
                      ? GlobalColorConstants.kGreenColor
                      : GlobalColorConstants.kGreyColor,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: StrokeText(
                    // Todo: Remove substring
                    text: player.gameOnlineSocketModel.socketId.substring(10),
                    textStyle: const TextStyle(
                      fontFamily: "CircularStd",
                      fontWeight: FontWeight.w900,
                      fontSize: 37.5,
                    ),
                  ),
                ),

                if (player.gameOnlineSocketModel.isLeader)
                  SvgPicture.asset(
                    GlobalPaths.svgOnlineLeaderIconPath,
                    semanticsLabel: "Leader icon",
                  ),

              ],
            ),
          )
          .toList(),
    );
  }
}
