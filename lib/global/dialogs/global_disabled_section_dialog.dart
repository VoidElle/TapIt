import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tapit/global/utils/global_functions.dart';
import 'package:tapit/global/widgets/global_action_button.dart';

import '../../../global/widgets/stroke_text.dart';

class GlobalDisabledSectionDialog extends StatelessWidget {

  const GlobalDisabledSectionDialog({
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
                  text: "WIP",
                  textAlign: TextAlign.center,
                  textColor: Color(0xFFFFFFFF),
                  textStyle: TextStyle(
                    height: 0.85,
                    fontFamily: "CircularStd",
                    fontWeight: FontWeight.w900,
                    fontSize: 60,
                  ),
                  strokeColor: Color(0xFF000000),
                  strokeWidth: 6,
                ),

                const SizedBox(
                  height: 15,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: Text(
                    "This section is still not completed.\nIt will be implemented in next releases",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium,
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
                          fromEnabled: false,
                          voidCallback: () {

                            // Redirect to the Menu page
                            GlobalFunctions.popIfADialogIsShown();

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
              child: Stack(
                children: [

                  Center(
                    child: Icon(
                      MdiIcons.accountHardHatOutline,
                      size: 45,
                      color: const Color(0xFF000000),
                    ),
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}