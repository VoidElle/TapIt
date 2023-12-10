import 'package:flutter/material.dart';
import 'package:tapit/global/utils/global_color_constants.dart';

class StrokeText extends StatelessWidget {

  final String text;
  final double strokeWidth;
  final Color textColor;
  final Color strokeColor;
  final TextStyle? textStyle;
  final TextAlign textAlign;

  const StrokeText({
    Key? key,
    required this.text,
    this.strokeWidth = 6,
    this.strokeColor = GlobalColorConstants.kFullBlackColor,
    this.textColor = GlobalColorConstants.kWhiteColor,
    this.textStyle,
    this.textAlign = TextAlign.center
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          textAlign: textAlign,
          style: TextStyle(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = strokeColor,
          ).merge(textStyle),
        ),
        Text(
          text,
          textAlign: textAlign,
          style: TextStyle(color: textColor).merge(textStyle),
        ),
      ],
    );
  }
}
