import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../global/utils/global_functions.dart';
import '../../../../global/widgets/global_action_button.dart';
import '../../../../global/widgets/stroke_text.dart';
import '../../../../menu/pages/menu_page.dart';

enum GameResult {
  win,
  lose,
}

class GameOnlineGameResultDialog extends StatelessWidget {

  final Color winnerColor;
  final GameResult gameResult;

  const GameOnlineGameResultDialog({
    required this.winnerColor,
    required this.gameResult,
    super.key,
  });

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

                Padding(
                  padding: const EdgeInsets.only(
                    top: 45,
                    bottom: 15,
                  ),
                  child: StrokeText(
                    text: gameResult == GameResult.win
                        ? "YOU WON"
                        : "YOU LOST",
                    strokeWidth: 7.5,
                    textStyle: const TextStyle(
                      height: 0.9,
                      fontFamily: "CircularStd",
                      fontWeight: FontWeight.w900,
                      fontSize: 75,
                    ),
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
                        message: "Home",
                        verticalOffset: 40,
                        child: GlobalActionButton(
                          iconData: MdiIcons.home,
                          voidCallback: () {

                            // Redirect to MenuPage
                            GlobalFunctions.redirectAndClearRootTree(MenuPage.route);

                          },
                        ),
                      ),

                      Tooltip(
                        message: "Rematch",
                        verticalOffset: 40,
                        child: GlobalActionButton(
                          iconData: MdiIcons.swordCross,
                          voidCallback: () {
                            // Todo
                          },
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          ),

          // Positioned(
          //   left: 20,
          //   right: 20,
          //   child: CircleAvatar(
          //     backgroundColor: Colors.white,
          //     radius: 45,
          //     child: BorderedBox(
          //       color: winnerColor,
          //       shape: const CircleBorder(
          //           side: BorderSide(
          //             color: Colors.white,
          //             width: 7.5,
          //             strokeAlign: BorderSide.strokeAlignOutside,
          //           )
          //       ),
          //     ),
          //   ),
          // ),

          Positioned(
            left: 20,
            right: 20,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 55,
              child: SvgPicture.asset(
                gameResult == GameResult.win
                    ? "assets/svgs/game/win_first_place.svg"
                    : "assets/svgs/game/win_second_place.svg",
                semanticsLabel: "",
              ),
            ),
          ),

        ],
      ),
    );
  }

}
