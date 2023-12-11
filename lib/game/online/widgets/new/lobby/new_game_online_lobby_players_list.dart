import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tapit/global/widgets/global_custom_rounded_circle.dart';

import '../../../../../global/utils/global_paths.dart';
import '../../../../../global/widgets/stroke_text.dart';

class NewGameOnlineLobbyPlayersList extends StatelessWidget {

  const NewGameOnlineLobbyPlayersList({super.key});

  @override
  Widget build(BuildContext context) {

    final List<String> playerNames = [
      "Figfy",
      "Fuzzbag"
    ];

    const String leaderName = "Figfy";

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: playerNames
          .map(
            (String playerName) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const GlobalCustomRoundedCircle(
                  height: 35,
                  width: 35,
                  strokeWidth: 3.5,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: StrokeText(
                    text: playerName,
                    textStyle: const TextStyle(
                      fontFamily: "CircularStd",
                      fontWeight: FontWeight.w900,
                      fontSize: 37.5,
                    ),
                  ),
                ),

                if (playerName == leaderName)
                  SvgPicture.asset(
                    GlobalPaths.svgOnlineLeaderIconPath,
                    semanticsLabel: "Leader icon",
                  ),

              ],
            ),
          )
          .toList(),
    );
  }

}
