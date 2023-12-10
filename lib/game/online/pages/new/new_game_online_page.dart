import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../global/utils/global_enums.dart';
import '../../../../global/utils/global_functions.dart';
import '../../../../global/widgets/global_action_button.dart';
import '../../../../global/widgets/global_complex_button.dart';
import '../../../../global/widgets/global_user_header.dart';
import '../../../../menu/pages/menu_page.dart';

class NewGameOnlinePage extends StatelessWidget {

  static const route = "/new-game-online-page";

  const NewGameOnlinePage({super.key});

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

                        },
                      ),

                      GlobalComplexButton(
                        padding: const EdgeInsets.only(
                          bottom: 15,
                        ),
                        globalComplexButtonType: GlobalComplexButtonType.joinGame,
                        enabled: true,
                        onTapCallback: () {

                        },
                      ),

                    ],
                  ),
                ),

                const Expanded(
                  child: SizedBox(),
                ),

                GlobalActionButton(
                  iconData: MdiIcons.home,
                  padding: const EdgeInsets.symmetric(
                    vertical: 25,
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
