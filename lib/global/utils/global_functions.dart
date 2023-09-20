import 'package:flutter/material.dart';
import 'package:tapit/game/local/pages/game_local_page.dart';

class GlobalFunctions {

  static MaterialPageRoute generateRoutes(RouteSettings settings) {

    late Widget returnScreen;

    switch (settings.name) {
      case GameLocalPage.route:
        returnScreen = const GameLocalPage();
        break;
    }

    return MaterialPageRoute(builder: (_) => returnScreen);
  }

}