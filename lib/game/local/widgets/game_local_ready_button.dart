import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
        child: Center(
          child: StrokeText(
            text: tr("game_local_ready_button"),
            textStyle: const TextStyle(
              fontFamily: "CircularStd",
              fontWeight: FontWeight.w900,
              fontSize: 20,
              letterSpacing: 0,
            ),
            strokeWidth: 5,
          ),
        ),
      ),
    ).animate()
        .fadeIn(
      delay: const Duration(milliseconds: 100),
    )
        .slideX(
      delay: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
    );
  }

}
