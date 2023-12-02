import 'package:audioplayers/audioplayers.dart';

class GlobalSoundsManager {

  static const String soundsPath = "sounds/";

  static const String musicPath = "${soundsPath}music.mp3";
  static const String gameTapPath = "${soundsPath}game_tap.wav";
  static const String menuButtonClickPath = "${soundsPath}menu_button_click.wav";
  static const String countdownSoundPath = "${soundsPath}countdown_sound.mp3";
  static const String winSoundPath = "${soundsPath}win_sound.wav";

  final AudioPlayer _musicAudioPlayer = AudioPlayer();
  final AudioPlayer _fxMenuTapAudioPlayer = AudioPlayer();
  final AudioPlayer _fxGameTapAudioPlayer = AudioPlayer();

  final AudioPlayer _winSoundAudioPlayer = AudioPlayer();
  final AudioPlayer _countdownSoundAudioPlayer = AudioPlayer();

  PlayerState getMusicAudioPlayerState() {
    return _musicAudioPlayer.state;
  }

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

  Future<void> playMenuTapFx() async {
    await _fxMenuTapAudioPlayer.play(
      AssetSource(
        menuButtonClickPath,
      ),
    );
  }

  Future<void> playGameTapFx() async {
    await _fxGameTapAudioPlayer.play(
      AssetSource(
        gameTapPath,
      ),
    );
  }

  Future<void> playWinSound() async {
    await _winSoundAudioPlayer.play(
      AssetSource(
        winSoundPath,
      ),
    );
  }

  Future<void> playCountdownSound() async {
    await _countdownSoundAudioPlayer.play(
      AssetSource(
        countdownSoundPath,
      ),
    );
  }

}