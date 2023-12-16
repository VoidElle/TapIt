import 'package:flutter/material.dart';

import '../utils/global_color_constants.dart';
import 'stroke_text.dart';

class GlobalCustomContainerBase extends StatelessWidget {

  final double height;
  final double width;

  final EdgeInsets padding;
  final EdgeInsets margin;

  final Color backgroundColor;

  final String text;
  final double lineHeight;
  final double fontSize;
  final double fontStrokeWidth;
  final double letterSpacing;

  final VoidCallback? callback;

  const GlobalCustomContainerBase({
    required this.height,
    required this.width,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(25),
    required this.backgroundColor,
    required this.text,
    this.lineHeight = 1,
    required this.fontSize,
    required this.fontStrokeWidth,
    this.letterSpacing = 0,
    this.callback,
    super.key,
  });

  const GlobalCustomContainerBase.small({
    this.height = 75,
    this.width = 250,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(25),
    required this.backgroundColor,
    required this.text,
    this.lineHeight = 1,
    required this.fontSize,
    required this.fontStrokeWidth,
    this.letterSpacing = 0,
    this.callback,
    super.key,
  });

  const GlobalCustomContainerBase.big({
    this.height = 80,
    this.width = 322,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(25),
    required this.backgroundColor,
    required this.text,
    this.lineHeight = 1,
    required this.fontSize,
    required this.fontStrokeWidth,
    this.letterSpacing = 0,
    this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (TapUpDetails _) {
        if (callback != null) {
          callback!();
        }
      },
      child: Container(
        height: height,
        width: width,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          border: Border.all(
            color: GlobalColorConstants.kFullBlackColor,
            width: 5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12.5),
          ),
          color: backgroundColor,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: StrokeText(
              text: text,
              textStyle: TextStyle(
                height: lineHeight,
                fontFamily: "CircularStd",
                fontWeight: FontWeight.w900,
                fontSize: fontSize,
                letterSpacing: letterSpacing,
              ),
              strokeWidth: fontStrokeWidth,
            ),
          ),
        ),
      ),
    );
  }

}
