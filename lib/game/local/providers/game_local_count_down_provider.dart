import 'package:flutter/animation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final gameLocalCountDownProvider = StateNotifierProvider.autoDispose<GameLocalCountDownProvider, Map>(
      (ref) => GameLocalCountDownProvider(),
);

class GameLocalCountDownProvider extends StateNotifier<Map> {

  // Initial state of the provider
  static final Map _initialState = {
    "countdown_texts": ["3", "2", "1", "TAP-IT", ""],
    "current_text_position": 0,
    "animation_controller": null,
    "animation": null,
    "is_countdown_visible": false,
    "is_countdown_showable": true,
    "start_count_down_function": null,
  };

  GameLocalCountDownProvider(): super({ ..._initialState });

  // Function to set the function to start the countdown
  void setStartCountdownFunction(Function function, {bool notify = true}) {
    notify
        ? state = {
            ...state,
            "start_count_down_function": function,
          }
        : state["start_count_down_function"] = function;
  }

  // Function to set if the countdown is visible
  void setIsCountdownVisible(bool newValue) {
    state = {
      ...state,
      "is_countdown_visible": newValue,
    };
  }

  // Function to increment the current text position +1
  void incrementCurrentTextPosition() {

    // Get the current position and the length of the texts' list
    final int currentTextPosition = state["current_text_position"];
    final int countDownTextsSize = state["countdown_texts"].length;

    // If the incrementation doesn't get out of bound of the array,
    // increment the currentTextPosition of +1
    if (currentTextPosition + 1 < countDownTextsSize) {
      state = {
        ...state,
        "current_text_position": currentTextPosition + 1,
      };
    }

  }

  // Function to set the current text position
  void setCurrentTextPosition(int currentTextPosition, { bool notify = true }) {
    notify
        ? state = {
            ...state,
            "current_text_position": currentTextPosition,
          }
        : state["current_text_position"] = currentTextPosition;
  }

  // Function to set the animation controller
  void setAnimationController(AnimationController animationController, { bool notify = true }) {
    notify
        ? state = {
            ...state,
            "animation_controller": animationController,
          }
        : state["animation_controller"] = animationController;
  }

  // Function to set the animation
  void setAnimation(Animation animation, { bool notify = true }) {
    notify
        ? state = {
            ...state,
            "animation": animation,
          }
        : state["animation"] = animation;
  }

  // Function to set if the countdown is showable
  void setCountdownShowable(bool newValue) {
    state = {
      ...state,
      "is_countdown_showable": newValue,
    };
  }

  // Function to reset the provider's state
  void reset() {
    state = {
      ...state,
      "is_countdown_visible": false,
      "is_countdown_showable": true,
      "current_text_position": 0,
    };
  }

  // Function to do a hard reset of the provider
  void hardReset() {
    state = {
      ..._initialState
    };
  }

}