import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../global/utils/global_color_constants.dart';

class MenuTextStyles {

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

  static TextStyle buttonTextStyle() {
    return GoogleFonts.odibeeSans(
      textStyle: const TextStyle(
        fontSize: 64,
        color: GlobalColorConstants.kBlackColor,
      ),
    );
  }

}