import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/game_local_game_status_provider.dart';

class GameLocalWinConfetti extends ConsumerStatefulWidget {

  const GameLocalWinConfetti({super.key});

  @override
  ConsumerState<GameLocalWinConfetti> createState() => _GameLocalWinConfettiState();
}

class _GameLocalWinConfettiState extends ConsumerState<GameLocalWinConfetti> {

  late ConfettiController _controllerCenter;

  Path _drawStar(Size size) {

    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {

      path.lineTo(
          halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step),
      );

      path.lineTo(
          halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep),
      );

    }
    path.close();
    return path;
  }

  @override
  void initState() {
    super.initState();

    // Declaration of the ConfettiController
    _controllerCenter = ConfettiController(
      duration: const Duration(
        seconds: 10,
      ),
    );

  }

  @override
  void dispose() {

    // Dispose the Confetti controller on disposing the widget
    _controllerCenter.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // Listen to provider's changes
    ref.listen(gameLocalGameStatusProvider, (Map? previous, Map next) {

      if (previous != null) {

        // Get the previous and the next state
        final bool previousHasPlayerWon = previous["has_player_won"];
        final bool nextHasPlayerWon = next["has_player_won"];

        // If the previous state has a NOT player won
        // and the next has it, show the confetti
        if (!previousHasPlayerWon && nextHasPlayerWon) {
          _controllerCenter.play();
        }

        // If the previous state HAS a player won
        // and the next has not it, stop the confetti
        if (previousHasPlayerWon && !nextHasPlayerWon) {
          _controllerCenter.stop();
        }

      }

    });

    return Align(
      alignment: Alignment.center,
      child: ConfettiWidget(
        confettiController: _controllerCenter,
        blastDirectionality: BlastDirectionality.explosive,
        shouldLoop: true,
        colors: const [
          Colors.green,
          Colors.blue,
          Colors.pink,
          Colors.orange,
          Colors.purple
        ],
        createParticlePath: _drawStar,
      ),
    );
  }
}
