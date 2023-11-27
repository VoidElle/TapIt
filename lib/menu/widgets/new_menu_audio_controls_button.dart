import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tapit/global/utils/global_constants.dart';
import 'package:tapit/global/utils/managers/global_shared_preferences_manager.dart';
import 'package:tapit/global/utils/managers/global_sounds_manager.dart';

class NewMenuAudioControlsButton extends ConsumerStatefulWidget {

  const NewMenuAudioControlsButton({super.key});

  @override
  ConsumerState<NewMenuAudioControlsButton> createState() => _NewMenuAudioControlsButtonState();
}

class _NewMenuAudioControlsButtonState extends ConsumerState<NewMenuAudioControlsButton> {

  final GlobalSharedPreferencesManager _globalSharedPreferencesManager = GlobalConstants.globalSharedPreferencesManager;
  final GlobalSoundsManager _globalSoundsManager = GlobalConstants.globalSoundsManager;

  late bool _isMusicEnabled;
  late bool _isFxEnabled;

  Future<void> _changeFxSoundsEnabled() async {

    setState(() => _isFxEnabled = !_isFxEnabled);
    _globalSharedPreferencesManager.setFxSoundsEnabled(_isFxEnabled);

    if (_isFxEnabled) {
      await _globalSoundsManager.playMenuTapFx();
    }

  }

  Future<void> _changeMusicEnabled() async {

    setState(() => _isMusicEnabled = !_isMusicEnabled);
    _globalSharedPreferencesManager.setMusicEnabled(_isMusicEnabled);

    if (_globalSoundsManager.getMusicAudioPlayerState() == PlayerState.stopped) {
      await _globalSoundsManager.playMusic();
      return;
    }

    _isMusicEnabled
        ? await _globalSoundsManager.resumeMusic()
        : await _globalSoundsManager.stopMusic();
  }

  @override
  void initState() {

    _isMusicEnabled = _globalSharedPreferencesManager.getMusicEnabled();
    _isFxEnabled = _globalSharedPreferencesManager.getFxSoundsEnabled();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 45,
          top: 25,
        ),
        child: Container(
          width: 125,
          height: 55,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            border: Border.all(
              width: 5,
              color: const Color(0xFF000000),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              GestureDetector(
                onTapUp: (TapUpDetails _) => _changeFxSoundsEnabled(),
                child: Icon(
                  _isFxEnabled
                      ? MdiIcons.volumeHigh
                      : MdiIcons.volumeOff,
                  color: const Color(0xFF000000),
                  size: 35,
                ),
              ),

              GestureDetector(
                onTapUp: (TapUpDetails _) => _changeMusicEnabled(),
                child: Icon(
                  _isMusicEnabled
                      ? MdiIcons.music
                      : MdiIcons.musicOff,
                  color: const Color(0xFF000000),
                  size: 35,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
