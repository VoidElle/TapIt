import 'package:flutter/material.dart';
import 'package:tapit/global/utils/global_enums.dart';
import 'package:tapit/global/utils/global_functions.dart';

import '../../game/local/pages/game_local_page.dart';
import '../../game/online/pages/game_online_menu_page.dart';
import '../../global/widgets/global_complex_button.dart';
import '../../global/widgets/global_user_header.dart';
import '../widgets/new_menu_audio_controls_button.dart';

class MenuPage extends StatelessWidget {

  static const route = "/menu-page";

  const MenuPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: deviceHeight,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                const GlobalUserHeader(),

                Column(
                  children: [

                    GlobalComplexButton(
                      globalComplexButtonType: GlobalComplexButtonType.local,
                      onTapCallback: () => GlobalFunctions.redirectAndClearRootTree(GameLocalPage.route),
                    ),

                    GlobalComplexButton(
                      globalComplexButtonType: GlobalComplexButtonType.online,
                      onTapCallback: () => GlobalFunctions.redirectAndClearRootTree(GameOnlineMenuPage.route),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                    ),

                    GlobalComplexButton(
                      globalComplexButtonType: GlobalComplexButtonType.shop,
                      onTapCallback: () {
                        // Todo
                      },
                    ),

                  ],
                ),


                const NewMenuAudioControlsButton(),

              ],
            ),
          ),
        ),
      ),
    );
  }

}
