import 'package:audioplayers/audioplayers.dart';

class GlobalSoundsManager {

  static const String musicPath = "sounds/music.mp3";

  final AudioPlayer _musicAudioPlayer = AudioPlayer();

  bool _isFxEnabled = true;
  final AudioPlayer _fxAudioPlayer = AudioPlayer();

  Future<void> resumeMusic() async {
    await _musicAudioPlayer.resume();
  }

  Future<void> playMusic() async {
    await _musicAudioPlayer.play(
      AssetSource(
        musicPath,
      ),
    );
  }

  Future<void> stopMusic() async {
    await _musicAudioPlayer.pause();
  }

  Future<void> resumeFx() async {
    await _musicAudioPlayer.resume();
  }

  Future<void> playFx() async {
    await _musicAudioPlayer.play(
      AssetSource(
        musicPath,
      ),
    );
  }

  Future<void> stopFx() async {
    await _musicAudioPlayer.stop();
  }

  void disableFxSounds() {
    _isFxEnabled = false;
  }

  void enableFxSounds() {
    _isFxEnabled = true;
  }

  bool get isFxEnabled => _isFxEnabled;

}