import "package:flutter/material.dart";

class GlobalColorConstants {

  /// Transparent section
  static const kTransparentColor = Color(0x00000000);

  /// White section
  static const kWhiteColor = Color(0xffffffff);

  /// Black section
  static const kBlackColor = Color(0xFF202020);
  static const kDarkBlackColor = Color(0xff1a1a1a);

  /// Blue section
  static const kBlueColor = Color(0xff4288FC);
  static const kDarkBlueColor = Color(0xff2B63D4);

  /// Red section
  static const kRedColor = Color(0xffFC5050);
  static const kDarkRedColor = Color(0xffC72738);

  /// Green section
  static const kGreenColor = Color(0xff50D37A);
  static const kDarkGreenColor = Color(0xff3AA559);
  static const kDarkestGreenColor = Color(0xff147e4f);

  /// Yellow section
  static const kYellowColor = Color(0xffe6db62);
  static const kDarkYellowColor = Color(0xff96843B);

  /// Grey section
  static const kGreyColor = Color(0xffbdbdbd);
  static const kDarkGreyColor = Color(0xff9e9e9e);
  static const kLightGreyColor = Color(0xffc4c4c4);
  static const kLightDarkGreyColor = Color(0xff999999);

  /// Cyan section
  static const kCyanColor = Color(0xff44dff6);

  /// Purple section
  static const kPurpleColor = Color(0xff582dff);
  static const kLightPurpleColor = Color(0xffb12eff);

  /// Orange section
  static const kOrangeColor = Color(0xfff69947);

  /// Palettes
  static const palettes = {
    0: [ kBlueColor,         kRedColor,          kGreenColor,      kYellowColor ],
    1: [ kPurpleColor,       kRedColor,          kOrangeColor,     kYellowColor ],
    2: [ kLightPurpleColor,  kPurpleColor,       kOrangeColor,     kRedColor    ],
    3: [ kRedColor,          kLightPurpleColor,  kDarkGreenColor,  kYellowColor ],
  };

}