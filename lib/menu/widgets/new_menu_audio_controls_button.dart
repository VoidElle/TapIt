import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tapit/global/providers/global_sounds_manager_provider.dart';
import 'package:tapit/global/utils/global_sounds_manager.dart';

class NewMenuAudioControlsButton extends ConsumerStatefulWidget {

  const NewMenuAudioControlsButton({super.key});

  @override
  ConsumerState<NewMenuAudioControlsButton> createState() => _NewMenuAudioControlsButtonState();
}

class _NewMenuAudioControlsButtonState extends ConsumerState<NewMenuAudioControlsButton> {

  bool _isVolumeEnabled = true;
  bool _isMusicEnabled = true;

  Future<void> _changeVolumeEnabled() async {

    final GlobalSoundsManager globalSoundsManager = ref.read(globalSoundsManagerProvider);

    setState(() => _isVolumeEnabled = !_isVolumeEnabled);

    _isVolumeEnabled
        ? globalSoundsManager.enableFxSounds()
        : globalSoundsManager.disableFxSounds();
  }

  Future<void> _changeMusicEnabled() async {

    final GlobalSoundsManager globalSoundsManager = ref.read(globalSoundsManagerProvider);

    setState(() => _isMusicEnabled = !_isMusicEnabled);

    _isMusicEnabled
        ? await globalSoundsManager.resumeMusic()
        : await globalSoundsManager.stopMusic();
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
                onTapUp: (TapUpDetails _) => _changeVolumeEnabled(),
                child: Icon(
                  _isVolumeEnabled
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
