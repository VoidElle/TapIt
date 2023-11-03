import 'package:flutter/material.dart';

import '../../../../global/utils/global_color_constants.dart';
import '../../utils/game_online_text_styles.dart';

class GameOnlineLobbyTitle extends StatelessWidget {

  final String text;
  final EdgeInsets padding;

  const GameOnlineLobbyTitle({
    super.key,
    this.text = "LOBBY",
    this.padding = const EdgeInsets.only(top: 50),
  });

  @override
  Widget build(BuildContext context) {

    final Size deviceSizes = MediaQuery.of(context).size;

    final double deviceHeight = deviceSizes.height;
    final double deviceWidth = deviceSizes.width;

    return Stack(
      children: [

        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100),
            ),
            color: GlobalColorConstants.kYellowColor,
            shape: BoxShape.rectangle,
          ),
          height: deviceHeight / 5,
          width: deviceWidth,
        ),

        Center(
          child: Padding(
            padding: padding,
            child: FittedBox(
              child: Text(
                text,
                maxLines: 1,
                style: GameOnlineTextStyles.titleTextStyle(),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
