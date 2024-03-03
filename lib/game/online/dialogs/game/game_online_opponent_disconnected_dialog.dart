import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tapit/global/utils/global_color_constants.dart';

import '../../../../global/widgets/global_action_button.dart';

class GameOnlineOpponentDisconnectedDialog extends StatelessWidget {

  const GameOnlineOpponentDisconnectedDialog({
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

                const Padding(
                  padding: EdgeInsets.only(
                    top: 45,
                    bottom: 15,
                  ),
                  child: Text(
                    "Your opponent has left the game, the match has been canceled.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
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
                  child: Consumer(
                      builder: (BuildContext _, WidgetRef ref, Widget? __) {
                        return Tooltip(
                          message: "Home",
                          verticalOffset: 40,
                          child: GlobalActionButton(
                            iconData: MdiIcons.close,
                            voidCallback: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        );
                      }
                  ),
                ),

              ],
            ),
          ),

          Positioned(
            left: 20,
            right: 20,
            child: Icon(
              MdiIcons.exitRun
            ),
          ),

          Positioned(
            left: 20,
            right: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 55,
              child: Icon(
                MdiIcons.exitRun,
                color: GlobalColorConstants.kBlackColor,
                size: 55,
              ),
            ),
          ),

        ],
      ),
    );
  }

}
