import 'package:flutter/material.dart';
import 'package:tapit/global/utils/managers/global_shared_preferences_manager.dart';
import 'package:tapit/global/utils/managers/global_sounds_manager.dart';

class GlobalConstants {

  static final GlobalSoundsManager globalSoundsManager = GlobalSoundsManager();
  static final GlobalSharedPreferencesManager globalSharedPreferencesManager = GlobalSharedPreferencesManager();

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static const String navigationWithContextNotMounted = "ERROR: Trying to use context whilst is not mounted! Aborting the redirection...";

  static const String sharedPreferencesMusicEnabledTag = "MUSIC_ENABLED";
  static const String sharedPreferencesFxSoundsEnabledTag = "FX_SOUNDS_ENABLED";

  static const String translationsPath = "assets/translations";

  static const Locale englishLocale = Locale('en', 'EN');
  static const Locale italianLocale = Locale('it', 'IT');

  static const List<Locale> supportedLocales = [
    englishLocale,
    italianLocale
  ];

  static const Locale fallbackLocale = englishLocale;

  static ThemeData globalTheme = ThemeData(
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: "CircularStd",
        color: Color(0xFFFFFFFF),
        fontSize: 20,
      ),
      displayMedium: TextStyle(
        fontFamily: "CircularStd",
        color: Color(0xFF000000),
        fontWeight: FontWeight.w900,
        fontSize: 20,
      ),
      displaySmall: TextStyle(
        fontFamily: "CircularStd",
        color: Color(0xFF000000),
      ),
    ),
  );

}