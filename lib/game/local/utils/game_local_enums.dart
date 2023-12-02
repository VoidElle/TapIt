import 'package:easy_localization/easy_localization.dart';

enum GameLocalPlayerEnum {
  top,
  bottom
}

extension GameLocalPlayerEnumExtension on GameLocalPlayerEnum {

  String get text {
    switch(this) {
      case GameLocalPlayerEnum.top:
        return tr("global_color_red");
      case GameLocalPlayerEnum.bottom:
        return tr("global_color_blue");
    }
  }

}