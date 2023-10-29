import 'package:flutter/material.dart';

import '../../../../global/utils/global_color_constants.dart';
import '../../utils/game_online_text_styles.dart';

class CustomTriangleClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {

    final path = Path();

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}

class GameOnlineLobbyTitle extends StatelessWidget {

  final String text;
  final double sectionSize;
  final EdgeInsets padding;

  const GameOnlineLobbyTitle({
    super.key,
    this.text = "ONLINE",
    this.sectionSize = 4,
    this.padding = const EdgeInsets.only(top: 50),
  });

  @override
  Widget build(BuildContext context) {

    final Size deviceSizes = MediaQuery.of(context).size;

    final double deviceHeight = deviceSizes.height;
    final double deviceWidth = deviceSizes.width;

    return Stack(
      children: [

        Row(
          children: [

            ClipPath(
              clipper: CustomTriangleClipper(),
              child: Container(
                width: deviceWidth / 2,
                height: deviceHeight / 4,
                color: GlobalColorConstants.kYellowColor,
              ),
            ),

            Transform.flip(
              flipX: true,
              child: ClipPath(
                clipper: CustomTriangleClipper(),
                child: Container(
                  width: deviceWidth / 2,
                  height: deviceHeight / 4,
                  color: GlobalColorConstants.kYellowColor,
                ),
              ),
            ),

          ],
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
