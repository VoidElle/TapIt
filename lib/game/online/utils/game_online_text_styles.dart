import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../global/utils/global_color_constants.dart';

class GameOnlineTextStyles {

  static TextStyle titleTextStyle() {
    return GoogleFonts.blackHanSans(
      textStyle: const TextStyle(
        fontSize: 85,
        color: GlobalColorConstants.kBlackColor,
        shadows: [
          Shadow(
            blurRadius: 0,
            color: GlobalColorConstants.kDarkYellowColor,
            offset: Offset(0, 10),
          ),
        ],
      ),
    );
  }

  static TextStyle lobbyInstructionTextStyle() {
    return GoogleFonts.rubik(
      textStyle: const TextStyle(
        fontSize: 20,
        color: GlobalColorConstants.kBlackColor,
      ),
    );
  }

  static TextStyle lobbyCodeTextStyle() {
    return GoogleFonts.blackHanSans(
      textStyle: TextStyle(
        fontSize: 65,
        color: GlobalColorConstants.kBlackColor,
        shadows: [
          Shadow(
            blurRadius: 0,
            color: GlobalColorConstants.kBlackColor.withOpacity(.4),
            offset: const Offset(0, 10),
          ),
        ],
      ),
    );
  }

}