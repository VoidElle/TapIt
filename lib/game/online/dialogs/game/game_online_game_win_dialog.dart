import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../global/widgets/global_action_button.dart';
import '../../../../global/widgets/global_bordered_box.dart';
import '../../../../global/widgets/stroke_text.dart';

class GameOnlineGameWinDialog extends StatelessWidget {

  final Color winnerColor;

  const GameOnlineGameWinDialog({
    required this.winnerColor,
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

                const StrokeText(
                  text: "GAME OVER",
                  textStyle: TextStyle(
                    height: 0.85,
                    fontFamily: "CircularStd",
                    fontWeight: FontWeight.w900,
                    fontSize: 60,
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: StrokeText(
                    text: "You won!",
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
                        message: "Home",
                        verticalOffset: 40,
                        child: GlobalActionButton(
                          iconData: MdiIcons.home,
                          voidCallback: () {
                            // Todo
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

          Positioned(
            left: 20,
            right: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 45,
              child: BorderedBox(
                color: winnerColor,
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
