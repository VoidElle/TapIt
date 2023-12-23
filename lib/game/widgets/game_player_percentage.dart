import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../global/widgets/stroke_text.dart';

class GamePlayersPercentage extends ConsumerWidget {

  final int value;

  const GamePlayersPercentage({
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StrokeText(
      text: "$value%",
      textColor: const Color(0xFFFFFFFF),
      textStyle: const TextStyle(
        fontFamily: "CircularStd",
        fontWeight: FontWeight.w900,
        fontSize: 20,
        letterSpacing: 0,
      ),
      strokeColor: const Color(0xFF000000),
      strokeWidth: 5,
    );
  }

}
