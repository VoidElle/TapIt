import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tapit/game/local/providers/game_local_game_status_provider.dart';
import 'package:tapit/global/utils/global_functions.dart';
import 'package:tapit/global/widgets/global_action_button.dart';
import 'package:tapit/menu/pages/menu_page.dart';

import '../../../global/utils/global_constants.dart';
import '../../../global/utils/managers/global_shared_preferences_manager.dart';
import '../../../global/utils/managers/global_sounds_manager.dart';
import '../../../global/widgets/global_bordered_box.dart';
import '../../../global/widgets/stroke_text.dart';
import '../utils/game_local_enums.dart';
import '../utils/game_local_functions.dart';

class GameLocalNewWinDialog extends ConsumerStatefulWidget {

  final GameLocalPlayerEnum gameLocalPlayerEnum;
  final Color winnerColor;
  final BannerAd? bannerAd;

  const GameLocalNewWinDialog({
    super.key,
    required this.gameLocalPlayerEnum,
    required this.winnerColor,
    required this.bannerAd,
  });

  @override
  ConsumerState<GameLocalNewWinDialog> createState() => _GameLocalNewWinDialogState();
}

class _GameLocalNewWinDialogState extends ConsumerState<GameLocalNewWinDialog> {

  final GlobalSharedPreferencesManager globalSharedPreferencesManager = GlobalConstants.globalSharedPreferencesManager;
  final GlobalSoundsManager globalSoundsManager = GlobalConstants.globalSoundsManager;

  @override
  void initState() {

    super.initState();

    // Set the player won state to true to show the confetti
    GlobalFunctions.executeAfterBuild(() {
      ref.read(gameLocalGameStatusProvider.notifier).setPlayerWon(true);
    });

    if (globalSharedPreferencesManager.getFxSoundsEnabled()) {
      globalSoundsManager.playWinSound();
    }

  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [

          Container(
            padding: const EdgeInsets.only(
              left: 20,
              top: 45 + 20,
              right: 20,
              bottom: 20,
            ),
            margin: const EdgeInsets.only(top: 45),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 10),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                StrokeText(
                  text: tr("dialog_local_game_over_title"),
                  textStyle: const TextStyle(
                    height: 0.85,
                    fontFamily: "CircularStd",
                    fontWeight: FontWeight.w900,
                    fontSize: 60,
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: StrokeText(
                    text: tr("dialog_local_game_over_won").replaceAll("%s", widget.gameLocalPlayerEnum.text),
                    textStyle: const TextStyle(
                      height: 0.85,
                      fontFamily: "CircularStd",
                      fontWeight: FontWeight.w900,
                      fontSize: 25,
                    ),
                    strokeWidth: 3,
                  ),
                ),

                const SizedBox(
                  height: 22,
                ),

                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 27.5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Tooltip(
                        message: tr("dialog_local_game_home_button_tooltip"),
                        verticalOffset: 40,
                        child: GlobalActionButton(
                          iconData: MdiIcons.home,
                          voidCallback: () {

                            // Reset the providers of the match
                            GameLocalFunctions.resetProviders(ref);

                            // Redirect to the Menu page
                            GlobalFunctions.redirect(MenuPage.route);

                          },
                        ),
                      ),

                      Tooltip(
                        message: tr("dialog_local_game_rematch_button_tooltip"),
                        verticalOffset: 40,
                        child: GlobalActionButton(
                          iconData: MdiIcons.swordCross,
                          voidCallback: () {

                            // Pop the dialog
                            GlobalConstants.navigatorKey.currentState?.pop();

                            // Reset the providers of the match
                            GameLocalFunctions.resetProviders(ref);

                            ref.read(gameLocalGameStatusProvider.notifier).setAdsNeedToBeReloaded(true);

                          },
                        ),
                      ),

                    ],
                  ),
                ),

                if (widget.bannerAd != null)
                  SizedBox(
                    width: 320,
                    height: 100,
                    child: AdWidget(
                      ad: widget.bannerAd!,
                    ),
                  ),

              ],
            ),
          ),

          Positioned(
            left: 20,
            right: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 45,
              child: BorderedBox(
                  color: widget.winnerColor,
                  shape: const CircleBorder(
                    side: BorderSide(
                      color: Colors.white,
                      width: 7.5,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    )
                  ),
                ),
            ),
          ),

        ],
      ),
    );
  }
}