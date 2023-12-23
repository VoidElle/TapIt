import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;
import 'package:tapit/global/utils/global_constants.dart';

import '../../../../global/models/global_socket_model.dart';
import '../../../../global/providers/global_socket_provider.dart';
import '../../../../global/utils/global_enums.dart';
import '../../../../global/utils/global_functions.dart';
import '../../../../global/widgets/global_complex_button.dart';
import '../../../../global/widgets/global_user_header.dart';
import '../../../../global/widgets/stroke_text.dart';
import '../../../../menu/pages/menu_page.dart';
import '../../event_listeners/player/game_online_player_change_listener_mixin.dart';
import '../../widgets/new/join/new_game_online_join_lobby_pin.dart';
import '../../widgets/new/new_game_online_back_home_buttons.dart';
import 'new_game_online_page.dart';

class NewGameOnlineJoinPage extends ConsumerStatefulWidget {

  static const route = "/new-game-online-join-page";

  const NewGameOnlineJoinPage({super.key});

  @override
  ConsumerState<NewGameOnlineJoinPage> createState() => _NewGameOnlineJoinPageState();
}

class _NewGameOnlineJoinPageState extends ConsumerState<NewGameOnlineJoinPage> with GameOnlinePlayerChangeListenerMixin {

  final List<TextEditingController> _textEditingControllers = List.generate(6, (int _) => TextEditingController());

  @override
  void initState() {

    super.initState();

    final socket_io.Socket? socket = ref.read(globalSocketProvider).socket;

    listenToPlayerChange(
      context: context,
      socket: socket,
      ref: ref,
      needsToJoin: true,
    );

  }

  @override
  Widget build(BuildContext context) {

    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double usableScreenHeight = mediaQuery.size.height - mediaQuery.padding.top;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: usableScreenHeight,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                const GlobalUserHeader(),

                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 50,
                  ),
                  child: StrokeText(
                    text: "INSERT LOBBY\nCODE",
                    textColor: Color(0xFFFFFFFF),
                    textStyle: TextStyle(
                      height: .95,
                      fontFamily: "CircularStd",
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                    ),
                    strokeColor: Color(0xFF000000),
                  ),
                ).animate()
                    .fadeIn(
                  delay: const Duration(milliseconds: 100),
                )
                    .slideX(
                  delay: const Duration(milliseconds: 100),
                  curve: Curves.easeOut,
                ),

                NewGameOnlineJoinLobbyPin(
                  textEditingControllers: _textEditingControllers,
                ),

                GlobalComplexButton(
                  padding: const EdgeInsets.only(
                    top: 25,
                  ),
                  globalComplexButtonType: GlobalComplexButtonType.joinGameFromPin,
                  enabled: true,
                  onTapCallback: () {

                    String lobbyId = "";

                    for (TextEditingController textEditingController in _textEditingControllers) {
                      lobbyId += textEditingController.text;
                    }

                    debugPrint("Lobby id: $lobbyId");

                    final GlobalSocketModel socketProvider = ref.read(globalSocketProvider);
                    final socket_io.Socket? socket = socketProvider.socket;

                    if (socket != null) {
                      GlobalConstants.gameOnlineSocketEmitter.emitJoinLobbyEvent(
                        socket: socket,
                        lobbyId: lobbyId,
                      );
                    }

                  },
                ),

                const Expanded(
                  child: SizedBox(),
                ),

                NewGameOnlineBackButtons(
                  backButtonCallback: () {
                    GlobalFunctions.redirectAndClearRootTree(NewGameOnlinePage.route);
                  },
                  homeButtonCallback: () {
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
}
