import 'package:audioplayers/audioplayers.dart';

class GlobalSoundsManager {

  static const String soundsPath = "sounds/";

  static const String musicPath = "${soundsPath}music.mp3";
  static const String gameTapPath = "${soundsPath}game_tap.wav";
  static const String menuButtonClickPath = "${soundsPath}menu_button_click.wav";

  final AudioPlayer _musicAudioPlayer = AudioPlayer();
  final AudioPlayer _fxMenuTapAudioPlayer = AudioPlayer();
  final AudioPlayer _fxGameTapAudioPlayer = AudioPlayer();

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

  Future<void> resumeMenuTapFx() async {
    await _fxMenuTapAudioPlayer.resume();
  }

  Future<void> playMenuTapFx() async {
    await _fxMenuTapAudioPlayer.play(
      AssetSource(
        menuButtonClickPath,
      ),
    );
  }

  Future<void> stopMenuTapFx() async {
    await _fxMenuTapAudioPlayer.stop();
  }

  Future<void> resumeGameTapFx() async {
    await _fxGameTapAudioPlayer.resume();
  }

  Future<void> playGameTapFx() async {
    await _fxGameTapAudioPlayer.play(
      AssetSource(
        gameTapPath,
      ),
    );
  }

  Future<void> stopGameTapFx() async {
    await _fxGameTapAudioPlayer.stop();
  }

}