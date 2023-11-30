import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/local/providers/game_local_count_down_provider.dart';
import 'package:tapit/game/local/providers/game_local_game_status_provider.dart';

import '../../../global/widgets/stroke_text.dart';

class GameLocalCountDown extends ConsumerStatefulWidget {

  const GameLocalCountDown({super.key});

  @override
  ConsumerState<GameLocalCountDown> createState() => _GameLocalCountDownState();
}

class _GameLocalCountDownState extends ConsumerState<GameLocalCountDown> with TickerProviderStateMixin {

  // Function to start the countdown
  Future<void> _startCountdown() async {

    // Get the state and the notifier
    final Map gameLocalCountDownState = ref.watch(gameLocalCountDownProvider);
    final gameLocalCountDownNotifier = ref.read(gameLocalCountDownProvider.notifier);

    // Variable to store if the countdown has already started
    // to prevent that the build function starts 1+ countdowns simultaneously
    gameLocalCountDownNotifier.setCountdownShowable(false);

    // Get the animation controller and make it goes forward
    final AnimationController animationController = gameLocalCountDownState["animation_controller"];
    animationController.forward();

    // Get the texts list and the current position of the text
    final List<String> countDownTexts = gameLocalCountDownState["countdown_texts"];
    int currentTextPosition = gameLocalCountDownState["current_text_position"];

    // Function that will change the countdown's text every second
    while (currentTextPosition < countDownTexts.length-1) {
      await Future.delayed(const Duration(seconds: 1), () {

        // Increment the text position inside the provider
        gameLocalCountDownNotifier.incrementCurrentTextPosition();

        // Set again the currentTextPosition to ensure that is updated
        currentTextPosition = ref.read(gameLocalCountDownProvider)["current_text_position"];

      });
    }

    // Set the countdown visible to false because it's already has been shown
    gameLocalCountDownNotifier.setIsCountdownVisible(false);

    // Start the game
    ref.read(gameLocalGameStatusProvider.notifier).startGame();

  }

  @override
  void initState() {

    // Get the notifier
    final gameLocalCountDownNotifier = ref.read(gameLocalCountDownProvider.notifier);

    // Initialize the animation controller
    // without notifying the listeners
    gameLocalCountDownNotifier.setAnimationController(
      AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
      ),
      notify: false,
    );

    // Initialize the animation
    // without notifying the listeners
    gameLocalCountDownNotifier.setAnimation(
      CurvedAnimation(
        parent: ref.read(gameLocalCountDownProvider)["animation_controller"],
        curve: Curves.fastOutSlowIn,
      ),
      notify: false,
    );

    // Initialize the function to start the countdown,
    // without notifying the listeners
    gameLocalCountDownNotifier.setStartCountdownFunction(
      _startCountdown,
      notify: false,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    // Get the state
    final gameLocalCountDownState = ref.watch(gameLocalCountDownProvider);

    // Get the device's sizes
    final Size deviceSizes = MediaQuery.of(context).size;
    final double deviceHeight = deviceSizes.height;
    final double deviceWidth = deviceSizes.width;

    // Get variables from provider's state
    final bool isCountdownVisible = gameLocalCountDownState["is_countdown_visible"];
    final Animation<double> countDownAnimation = gameLocalCountDownState["animation"];
    final List<String> countDownTexts = gameLocalCountDownState["countdown_texts"];
    final int currentTextPosition = gameLocalCountDownState["current_text_position"];

    return SizedBox(
      height: deviceHeight,
      width: deviceWidth,
      child: Center(
        child: Visibility(
          visible: isCountdownVisible,
          child: ScaleTransition(
            scale: countDownAnimation,
            child: StrokeText(
              text: countDownTexts[currentTextPosition],
              textColor: const Color(0xFFFFFFFF),
              textStyle: const TextStyle(
                fontFamily: "CircularStd",
                fontWeight: FontWeight.w900,
                fontSize: 60,
                letterSpacing: 0,
              ),
              strokeColor: const Color(0xFF000000),
              strokeWidth: 5,
            )
          ),
        ),
      ),
    );
  }

}