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

}