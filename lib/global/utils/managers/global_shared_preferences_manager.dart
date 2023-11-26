import 'package:shared_preferences/shared_preferences.dart';
import 'package:tapit/global/utils/global_constants.dart';

class GlobalSharedPreferencesManager {

  SharedPreferences? _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  Future<void> setMusicEnabled(bool value) async {
    await _sharedPreferences?.setBool(GlobalConstants.sharedPreferencesMusicEnabledTag, value);
  }

  bool getMusicEnabled() {
    final bool? value = _sharedPreferences?.getBool(GlobalConstants.sharedPreferencesMusicEnabledTag);
    return value ?? true;
  }

  Future<void> setFxSoundsEnabled(bool value) async {
    await _sharedPreferences?.setBool(GlobalConstants.sharedPreferencesFxSoundsEnabledTag, value);
  }

  bool getFxSoundsEnabled() {
    final bool? value = _sharedPreferences?.getBool(GlobalConstants.sharedPreferencesFxSoundsEnabledTag);
    return value ?? true;
  }

}