import 'package:flutter/material.dart';
import 'package:tapit/global/utils/global_color_constants.dart';

class GlobalCustomRoundedCircle extends StatelessWidget {
  final double width;
  final double height;

  final Color color;
  final Color strokeColor;

  final double strokeWidth;

  const GlobalCustomRoundedCircle({
    super.key,
    this.color = GlobalColorConstants.kGreyColor,
    this.strokeWidth = 3,
    this.width = 20,
    this.height = 20,
    this.strokeColor = GlobalColorConstants.kFullBlackColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: strokeColor,
          width: strokeWidth,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
    );
  }
}
