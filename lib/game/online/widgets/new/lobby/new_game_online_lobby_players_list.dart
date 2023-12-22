import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;
import 'package:tapit/game/online/providers/game_online_game_provider.dart';
import 'package:tapit/global/widgets/global_custom_rounded_circle.dart';

import '../../../../../global/providers/global_socket_provider.dart';
import '../../../../../global/utils/global_color_constants.dart';
import '../../../../../global/utils/global_paths.dart';
import '../../../../../global/widgets/stroke_text.dart';
import '../../../mixins/game_online_socket_lobby_players_change_listener_mixin.dart';
import '../../../models/player/game_online_player_model.dart';
import '../../../models/socket/game_online_socket_model.dart';

class NewGameOnlineLobbyPlayersList extends ConsumerStatefulWidget {

  const NewGameOnlineLobbyPlayersList({super.key});

  @override
  ConsumerState<NewGameOnlineLobbyPlayersList> createState() => _NewGameOnlineLobbyPlayersListState();
}

class _NewGameOnlineLobbyPlayersListState extends ConsumerState<NewGameOnlineLobbyPlayersList> with GameOnlineSocketLobbyPlayersChangeListenerMixin {

  @override
  void initState() {

    final socket_io.Socket? socket = ref.read(globalSocketProvider).socket;
    listenToPlayerChange(context, socket, ref);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final List<String> socketIdsList = [];

    final GameOnlineGameNotifier gameOnlineGameNotifier = ref.read(gameOnlineGameProvider.notifier);
    final List<GameOnlinePlayerModel> players = ref.watch(gameOnlineGameProvider).players;

    for (GameOnlinePlayerModel gameOnlinePlayerModel in players) {
      final GameOnlineSocketModel gameOnlineSocketModel = gameOnlinePlayerModel.gameOnlineSocketModel;
      final String socketId = gameOnlineSocketModel.socketId;
      socketIdsList.add(socketId);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: socketIdsList
          .map(
            (String playerName) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                GlobalCustomRoundedCircle(
                  height: 35,
                  width: 35,
                  strokeWidth: 3.5,
                  color: gameOnlineGameNotifier.getPlayer(playerName)!.readyStatus
                      ? GlobalColorConstants.kGreenColor
                      : GlobalColorConstants.kGreyColor,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: StrokeText(
                    // Todo: Remove substring
                    text: playerName.substring(10),
                    textStyle: const TextStyle(
                      fontFamily: "CircularStd",
                      fontWeight: FontWeight.w900,
                      fontSize: 37.5,
                    ),
                  ),
                ),

                if (false)
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
