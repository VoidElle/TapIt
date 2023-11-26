import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NewMenuAudioControlsButton extends StatefulWidget {

  const NewMenuAudioControlsButton({super.key});

  @override
  State<NewMenuAudioControlsButton> createState() => _NewMenuAudioControlsButtonState();
}

class _NewMenuAudioControlsButtonState extends State<NewMenuAudioControlsButton> {

  bool _isVolumeEnabled = true;
  bool _isMusicEnabled = true;

  void _changeVolumeEnabled() {
    setState(() => _isVolumeEnabled = !_isVolumeEnabled);
  }

  void _changeMusicEnabled() {
    setState(() => _isMusicEnabled = !_isMusicEnabled);
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
