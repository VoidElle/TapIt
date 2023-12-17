import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket_io;
import 'package:tapit/game/online/pages/lobby/new_game_online_join_page.dart';

import '../../../../global/models/global_socket_model.dart';
import '../../../../global/providers/global_socket_provider.dart';
import '../../../../global/utils/global_enums.dart';
import '../../../../global/utils/global_functions.dart';
import '../../../../global/widgets/global_complex_button.dart';
import '../../../../global/widgets/global_home_button.dart';
import '../../../../global/widgets/global_user_header.dart';
import '../../enums/socket_enums.dart';
import '../../mixins/game_online_socket_lobby_creation_listener_mixin.dart';
import '../../utils/game_online_functions.dart';
import '../../mixins/game_online_socket_connectivity_change_listener_mixin.dart';

class NewGameOnlinePage extends ConsumerStatefulWidget {

  static const route = "/new-game-online-page";

  const NewGameOnlinePage({super.key});

  @override
  ConsumerState<NewGameOnlinePage> createState() => _NewGameOnlinePageState();
}

class _NewGameOnlinePageState extends ConsumerState<NewGameOnlinePage> with GameOnlineSocketConnectivityChangeListenerMixin, GameOnlineSocketLobbyCreationListenerMixin {

  @override
  void initState() {

    super.initState();

    // Getting the socket notifier pre initialization
    final socketNotifierPreInitialization = ref.read(globalSocketProvider.notifier);

    // Initialization of the socket connection if it hasn't been initialized yet
    // (Connect with the Server)
    if (!socketNotifierPreInitialization.isSocketInitialized()) {
      GameOnlineFunctions.initSocketConnection(ref);
    }

  }

  @override
  Widget build(BuildContext context) {

    listenSocketConnectivityChange(ref);

    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double usableScreenHeight = mediaQuery.size.height - mediaQuery.padding.top;

    final GlobalSocketModel socketProvider = ref.read(globalSocketProvider);
    final socket_io.Socket? socket = socketProvider.socket;

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

                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 50,
                  ),
                  child: Column(
                    children: [

                      GlobalComplexButton(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        globalComplexButtonType: GlobalComplexButtonType.createGame,
                        enabled: true,
                        onTapCallback: () {

                          // Emit the create lobby request
                          socket?.emit(GameOnlineSocketEvent.createLobbyRequest.text);

                          // Listen to the create lobby response
                          listenToSocketLobbyCreationEvent(socket, ref);

                        },
                      ),

                      GlobalComplexButton(
                        padding: const EdgeInsets.only(
                          bottom: 15,
                        ),
                        globalComplexButtonType: GlobalComplexButtonType.joinGame,
                        enabled: true,
                        onTapCallback: () {
                          GlobalFunctions.redirectAndClearRootTree(NewGameOnlineJoinPage.route);
                        },
                      ),

                    ],
                  ),
                ),

                const Expanded(
                  child: SizedBox(),
                ),

                const GlobalHomeButton(),

              ],
            ),
          ),
        ),
      ),
    );
  }


}
