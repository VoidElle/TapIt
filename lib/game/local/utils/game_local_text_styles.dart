import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../global/utils/global_color_constants.dart';

class GameLocalTextStyles {

  static TextStyle countDownTextStyle() {
    return GoogleFonts.odibeeSans(
      textStyle: const TextStyle(
        fontSize: 56,
        color: GlobalColorConstants.kWhiteColor,
      ),
    );
  }

  static TextStyle percentageTextStyle() {
    return GoogleFonts.odibeeSans(
      textStyle: const TextStyle(
        fontSize: 20,
        color: GlobalColorConstants.kWhiteColor,
      ),
    );
  }

  static TextStyle readyButtonTextStyle() {
    return GoogleFonts.odibeeSans(
      textStyle: const TextStyle(
        fontSize: 20,
        color: GlobalColorConstants.kWhiteColor,
      ),
    );
  }

  static TextStyle winDialogTitleTextStyle() {
    return GoogleFonts.odibeeSans(
      textStyle: const TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.bold,
        color: GlobalColorConstants.kBlackColor,
      ),
    );
  }

  static TextStyle winDialogBodyTextStyle() {
    return GoogleFonts.rubik(
      textStyle: const TextStyle(
        fontSize: 16,
        color: GlobalColorConstants.kBlackColor,
      ),
    );
  }

  static TextStyle actionButtonTextStyle(Color winnerColor) {
    return TextStyle(
      fontSize: 18,
      color: winnerColor,
    );
  }

}