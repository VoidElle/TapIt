enum GameLocalPlayerEnum {
  top,
  bottom
}

extension GameLocalPlayerEnumExtension on GameLocalPlayerEnum {

  String get text {
    switch(this) {
      case GameLocalPlayerEnum.top:
        return "Red";
      case GameLocalPlayerEnum.bottom:
        return "Blue";
    }
  }

}