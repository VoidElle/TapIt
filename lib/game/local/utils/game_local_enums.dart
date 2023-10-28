enum GameLocalPlayerEnum {
  top,
  bottom
}

extension GameLocalPlayerEnumExtension on GameLocalPlayerEnum {

  String get text {
    switch(this) {
      case GameLocalPlayerEnum.top:
        return "Top";
      case GameLocalPlayerEnum.bottom:
        return "Bottom";
    }
  }

}