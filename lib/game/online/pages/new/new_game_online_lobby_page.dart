import 'package:flutter/material.dart';
import 'package:tapit/game/online/widgets/new/lobby/new_game_online_lobby_players_list.dart';

import '../../../../global/utils/global_color_constants.dart';
import '../../../../global/utils/global_functions.dart';
import '../../../../menu/pages/menu_page.dart';
import '../../../../global/widgets/global_custom_container_base.dart';
import '../../widgets/new/new_game_online_back_home_buttons.dart';
import 'new_game_online_page.dart';

class NewGameOnlineLobbyPage extends StatelessWidget {

  static const route = "/new-game-online-lobby-page";

  const NewGameOnlineLobbyPage({super.key});

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

                const GlobalCustomContainerBase.big(
                  backgroundColor: GlobalColorConstants.kRedColor,
                  text: '000000',
                  lineHeight: 0.85,
                  fontSize: 60,
                  fontStrokeWidth: 8,
                  letterSpacing: 7.5,
                ),

                const Expanded(
                  child: SizedBox(),
                ),

                const NewGameOnlineLobbyPlayersList(),

                const Expanded(
                  child: SizedBox(),
                ),

                const GlobalCustomContainerBase.small(
                  margin: EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 7.5,
                  ),
                  backgroundColor: GlobalColorConstants.kBlueColor,
                  text: 'START GAME',
                  fontSize: 28,
                  fontStrokeWidth: 4,
                ),

                const GlobalCustomContainerBase.small(
                  margin: EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 7.5,
                  ),
                  backgroundColor: GlobalColorConstants.kBlueColor,
                  text: 'CHANGE READY',
                  fontSize: 28,
                  fontStrokeWidth: 4,
                ),

                SizedBox(
                  height: usableScreenHeight / 12.5,
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
