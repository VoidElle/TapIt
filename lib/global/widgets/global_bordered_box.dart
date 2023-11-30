import 'package:flutter/material.dart';

class BorderedBox extends StatelessWidget {

  final Color color;

  const BorderedBox({
    super.key,
    required this.color,
    required this.shape,
  });

  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: ShapeDecoration(
        color: color,
        shape: shape,
      ),
    );
  }

}