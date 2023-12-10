import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../global/utils/global_enums.dart';
import '../../../../global/utils/global_functions.dart';
import '../../../../global/widgets/global_action_button.dart';
import '../../../../global/widgets/global_complex_button.dart';
import '../../../../global/widgets/global_user_header.dart';
import '../../../../global/widgets/stroke_text.dart';
import '../../../../menu/pages/menu_page.dart';
import '../../widgets/new/join/new_game_online_join_lobby_pin.dart';

class NewGameOnlineJoinPage extends StatelessWidget {

  static const route = "/new-game-online-join-page";

  const NewGameOnlineJoinPage({super.key});

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

                NewGameOnlineJoinLobbyPin(),

                GlobalComplexButton(
                  padding: const EdgeInsets.only(
                    top: 25,
                  ),
                  globalComplexButtonType: GlobalComplexButtonType.joinGameFromPin,
                  enabled: true,
                  onTapCallback: () {

                  },
                ),

                const Expanded(
                  child: SizedBox(),
                ),

                GlobalActionButton(
                  iconData: MdiIcons.home,
                  padding: const EdgeInsets.only(
                    bottom: 75,
                  ),
                  animated: true,
                  voidCallback: () {

                    // Redirect to the Menu page
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
