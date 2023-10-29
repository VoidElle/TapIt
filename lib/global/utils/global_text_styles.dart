import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'global_color_constants.dart';

class GlobalTextStyles {

  static TextStyle buttonTextStyle() {
    return GoogleFonts.odibeeSans(
      textStyle: const TextStyle(
        fontSize: 64,
        color: GlobalColorConstants.kBlackColor,
      ),
    );
  }

}