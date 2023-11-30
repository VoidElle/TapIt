import 'package:flutter/material.dart';

import '../../../global/widgets/stroke_text.dart';

class GameLocalReadyButton extends StatelessWidget {

  final VoidCallback onTapCallback;

  const GameLocalReadyButton({
    required this.onTapCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (TapUpDetails _) => onTapCallback(),
      child: Container(
        width: 175,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF202020),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          border: Border.all(
            width: 5,
            color: const Color(0xFF000000),
          ),
        ),
        child: const Center(
          child: StrokeText(
            text: "READY",
            textColor: Color(0xFFFFFFFF),
            textStyle: TextStyle(
              fontFamily: "CircularStd",
              fontWeight: FontWeight.w900,
              fontSize: 20,
              letterSpacing: 0,
            ),
            strokeColor: Color(0xFF000000),
            strokeWidth: 5,
          ),
        ),
      ),
    );
  }

}
