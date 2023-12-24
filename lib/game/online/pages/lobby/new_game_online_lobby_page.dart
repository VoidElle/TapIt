import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;
import 'package:tapit/game/online/event_listeners/lobby/game_online_lobby_start_listener_mixin.dart';
import 'package:tapit/global/utils/global_constants.dart';

import '../../../../global/providers/global_socket_provider.dart';
import '../../../../global/utils/global_color_constants.dart';
import '../../../../global/utils/global_functions.dart';
import '../../../../menu/pages/menu_page.dart';
import '../../../../global/widgets/global_custom_container_base.dart';
import '../../event_listeners/player/game_online_player_change_status_listener_mixin.dart';
import '../../models/game/game_online_game_model.dart';
import '../../models/player/game_online_player_model.dart';
import '../../providers/game_online_game_provider.dart';
import '../../widgets/lobby/new_game_online_lobby_players_list.dart';
import '../../widgets/new_game_online_back_home_buttons.dart';
import 'new_game_online_page.dart';

class NewGameOnlineLobbyPage extends ConsumerStatefulWidget {

  static const route = "/new-game-online-lobby-page";

  const NewGameOnlineLobbyPage({super.key});

  @override
  ConsumerState<NewGameOnlineLobbyPage> createState() => _NewGameOnlineLobbyPageState();
}

class _NewGameOnlineLobbyPageState extends ConsumerState<NewGameOnlineLobbyPage> with
    GameOnlinePlayerChangeStatusListenerMixin,
    GameOnlineLobbyStartListenerMixin {

  bool _startGameButtonEnabled = false;
  late socket_io.Socket _socket;

  @override
  void initState() {

    super.initState();

    _socket = ref.read(globalSocketProvider).socket!;

    listenToPlayerChangeStatusEvent(
      context: context,
      ref: ref,
      socket: _socket,
    );

    listenLobbyStartEvent(
      context: context,
      socket: _socket,
    );

  }

  @override
  Widget build(BuildContext context) {

    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double usableScreenHeight = mediaQuery.size.height - mediaQuery.padding.top;

    final GameOnlineGameModel gameOnlineGameState = ref.watch(gameOnlineGameProvider);
    final List<GameOnlinePlayerModel> playersList = gameOnlineGameState.players;

    final GameOnlineGameNotifier gameOnlineGameNotifier = ref.read(gameOnlineGameProvider.notifier);

    _checkStartGameButtonEnabled(playersList);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: usableScreenHeight,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                GlobalCustomContainerBase.big(
                  backgroundColor: GlobalColorConstants.kRedColor,
                  text: gameOnlineGameState.lobbyId,
                  lineHeight: 0.85,
                  fontSize: 60,
                  fontStrokeWidth: 8,
                  letterSpacing: 7.5,
                  callback: () async {
                    await Clipboard.setData(
                      ClipboardData(
                        text: gameOnlineGameState.lobbyId,
                      ),
                    );
                  },
                ),

                const Expanded(
                  child: SizedBox(),
                ),

                const NewGameOnlineLobbyPlayersList(),

                const Expanded(
                  child: SizedBox(),
                ),

                // Render the start game button only if
                // the player is the leader of the lobby
                if (gameOnlineGameNotifier.isSocketLeader(_socket.id!))
                  GlobalCustomContainerBase.small(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 7.5,
                    ),
                    backgroundColor: GlobalColorConstants.kBlueColor,
                    text: 'START GAME',
                    fontSize: 28,
                    fontStrokeWidth: 4,
                    enabled: _startGameButtonEnabled,
                    callback: () {
                      GlobalConstants.gameOnlineSocketEmitter.emitStartLobbyEvent(
                        socket: _socket,
                        lobbyId: gameOnlineGameState.lobbyId,
                      );
                    },
                  ),

                GlobalCustomContainerBase.small(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 7.5,
                  ),
                  backgroundColor: GlobalColorConstants.kBlueColor,
                  text: 'CHANGE STATUS',
                  fontSize: 26,
                  fontStrokeWidth: 4,
                  callback: () {
                    GlobalConstants.gameOnlineSocketEmitter.emitChangeReadyStatusEvent(
                      socket: _socket,
                      lobbyId: gameOnlineGameState.lobbyId,
                    );
                  },
                ),

                SizedBox(
                  height: usableScreenHeight / 12.5,
                ),

                NewGameOnlineBackButtons(
                  backButtonCallback: () {
                    _quitLobby(gameOnlineGameState);
                    GlobalFunctions.redirectAndClearRootTree(NewGameOnlinePage.route);
                  },
                  homeButtonCallback: () {
                    _quitLobby(gameOnlineGameState);
                    GlobalFunctions.redirectAndClearRootTree(MenuPage.route);
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void _quitLobby(GameOnlineGameModel gameOnlineGameState) {
    GlobalConstants.gameOnlineSocketEmitter.emitQuitLobbyEvent(
      socket: _socket,
      lobbyId: gameOnlineGameState.lobbyId,
    );
  }

  void _checkStartGameButtonEnabled(List<GameOnlinePlayerModel> players) {

    bool enabled = true;

    if (players.length > 1) {

      for (GameOnlinePlayerModel gameOnlinePlayerModel in players) {
        if (!gameOnlinePlayerModel.readyStatus) {
          enabled = false;
          break;
        }
      }

    } else {
      enabled = false;
    }

    setState(() {
      _startGameButtonEnabled = enabled;
    });

  }

}
