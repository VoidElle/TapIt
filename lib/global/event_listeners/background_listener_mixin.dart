import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../utils/global_constants.dart';
import '../utils/global_functions.dart';
import '../utils/managers/global_shared_preferences_manager.dart';
import '../utils/managers/global_sounds_manager.dart';

mixin BackgroundListenerMixin<T extends StatefulWidget> on WidgetsBindingObserver, State<T> {

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

    setState(() {});

    switch (state) {
      case AppLifecycleState.resumed:

        debugPrint("App resumed...");

        // Getting if the music is enabled in the GlobalSharedPreferences
        final GlobalSharedPreferencesManager globalSharedPreferencesManager = GlobalConstants.globalSharedPreferencesManager;
        final bool isMusicEnabled = globalSharedPreferencesManager.getMusicEnabled();

        // If the music is enabled, play it
        if (isMusicEnabled) {
          GlobalFunctions.executeAfterBuild(() {
            final GlobalSoundsManager globalSoundsManager = GlobalConstants.globalSoundsManager;
            globalSoundsManager.playMusic();
          });
        }

        break;
      case AppLifecycleState.paused:

        debugPrint("App went in background...");

        // Getting if the music is enabled in the GlobalSharedPreferences
        final GlobalSharedPreferencesManager globalSharedPreferencesManager = GlobalConstants.globalSharedPreferencesManager;
        final bool isMusicEnabled = globalSharedPreferencesManager.getMusicEnabled();

        // If the music is enabled, stop it
        if (isMusicEnabled) {
          final GlobalSoundsManager globalSoundsManager = GlobalConstants.globalSoundsManager;
          if (globalSoundsManager.getMusicAudioPlayerState() == PlayerState.playing) {
            globalSoundsManager.stopMusic();
          }
        }

        break;
      default:
        break;
    }

    super.didChangeAppLifecycleState(state);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

}