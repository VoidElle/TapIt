import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;
import 'package:tapit/game/online/providers/game_online_game_provider.dart';
import 'package:tapit/global/widgets/global_custom_rounded_circle.dart';

import '../../../../../global/models/global_socket_model.dart';
import '../../../../../global/providers/global_socket_provider.dart';
import '../../../../../global/utils/global_paths.dart';
import '../../../../../global/widgets/stroke_text.dart';
import '../../../mixins/game_online_socket_lobby_players_change_listener_mixin.dart';
import '../../../models/game/game_online_game_model.dart';
import '../../../models/player/game_online_player_model.dart';
import '../../../models/socket/game_online_socket_model.dart';

class NewGameOnlineLobbyPlayersList extends ConsumerWidget with GameOnlineSocketLobbyPlayersChangeListenerMixin {

  const NewGameOnlineLobbyPlayersList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final GlobalSocketModel socketProvider = ref.read(globalSocketProvider);
    final socket_io.Socket? socket = socketProvider.socket;

    listenToPlayerChange(context, socket, ref);

    final List<String> socketIdsList = [];

    final GameOnlineGameModel gameOnlineGameState = ref.watch(gameOnlineGameProvider);
    final List<GameOnlinePlayerModel> players = gameOnlineGameState.players;

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

                const GlobalCustomRoundedCircle(
                  height: 35,
                  width: 35,
                  strokeWidth: 3.5,
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
