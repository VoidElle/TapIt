import 'package:flutter/material.dart';
import 'package:tapit/global/utils/global_constants.dart';
import 'package:tapit/global/utils/global_enums.dart';
import 'package:tapit/global/utils/global_functions.dart';
import 'package:tapit/global/utils/managers/global_shared_preferences_manager.dart';
import 'package:tapit/global/utils/managers/global_sounds_manager.dart';

import '../../game/local/pages/game_local_page.dart';
import '../../game/online/pages/game_online_menu_page.dart';
import '../../global/event_listeners/background_listener_mixin.dart';
import '../../global/widgets/global_complex_button.dart';
import '../../global/widgets/global_user_header.dart';
import '../widgets/new_menu_audio_controls_button.dart';

class MenuPage extends StatefulWidget {

  static const String route = "/menu-page";

  const MenuPage({
    super.key,
  });

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with
    WidgetsBindingObserver,
    BackgroundListenerMixin<MenuPage> {

  @override
  void initState() {

    final GlobalSharedPreferencesManager globalSharedPreferencesManager = GlobalConstants.globalSharedPreferencesManager;
    final bool isMusicEnabled = globalSharedPreferencesManager.getMusicEnabled();

    if (isMusicEnabled) {
      GlobalFunctions.executeAfterBuild(() {
        final GlobalSoundsManager globalSoundsManager = GlobalConstants.globalSoundsManager;
        globalSoundsManager.playMusic();
      });
    }

    super.initState();
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

                Column(
                  children: [

                    GlobalComplexButton(
                      globalComplexButtonType: GlobalComplexButtonType.local,
                      enabled: GlobalConstants.localGameEnabled,
                      onTapCallback: () => GlobalFunctions.redirectAndClearRootTree(GameLocalPage.route),
                    ),

                    GlobalComplexButton(
                      i: 1,
                      globalComplexButtonType: GlobalComplexButtonType.online,
                      enabled: GlobalConstants.onlineGameEnabled,
                      onTapCallback: () => GlobalFunctions.redirectAndClearRootTree(GameOnlineMenuPage.route),
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                    ),

                    GlobalComplexButton(
                      i: 2,
                      globalComplexButtonType: GlobalComplexButtonType.shop,
                      enabled: GlobalConstants.shopEnabled,
                      bypassSvgUseJpg: true,
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
