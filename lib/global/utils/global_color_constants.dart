import "package:flutter/material.dart";

class GlobalColorConstants {

  /// Transparent section
  static const Color kTransparentColor = Color(0x00000000);

  /// White section
  static const Color kWhiteColor = Color(0xffffffff);

  /// Black section
  static const Color kBlackColor = Color(0xFF202020);
  static const Color kFullBlackColor = Color(0xFF000000);
  static const Color kDarkBlackColor = Color(0xff1a1a1a);

  /// Blue section
  static const Color kBlueColor = Color(0xff4288FC);
  static const Color kDarkBlueColor = Color(0xff2B63D4);

  /// Red section
  static const Color kRedColor = Color(0xffFC5050);
  static const Color kDarkRedColor = Color(0xffC72738);

  /// Green section
  static const Color kGreenColor = Color(0xff50D37A);
  static const Color kDarkGreenColor = Color(0xff3AA559);
  static const Color kDarkestGreenColor = Color(0xff147e4f);

  /// Yellow section
  static const Color kYellowColor = Color(0xffe6db62);
  static const Color kDarkYellowColor = Color(0xff96843B);

  /// Grey section
  static const Color kGreyColor = Color(0xffbdbdbd);
  static const Color kDarkGreyColor = Color(0xff9e9e9e);
  static const Color kLightGreyColor = Color(0xffc4c4c4);
  static const Color kLightDarkGreyColor = Color(0xff999999);

  /// Cyan section
  static const Color kCyanColor = Color(0xff44dff6);

  /// Purple section
  static const Color kPurpleColor = Color(0xff582dff);
  static const Color kLightPurpleColor = Color(0xffb12eff);

  /// Orange section
  static const Color kOrangeColor = Color(0xfff69947);

  /// Palettes
  static const palettes = {
    0: [ kBlueColor,         kRedColor,          kGreenColor,      kYellowColor ],
    1: [ kPurpleColor,       kRedColor,          kOrangeColor,     kYellowColor ],
    2: [ kLightPurpleColor,  kPurpleColor,       kOrangeColor,     kRedColor    ],
    3: [ kRedColor,          kLightPurpleColor,  kDarkGreenColor,  kYellowColor ],
  };

}