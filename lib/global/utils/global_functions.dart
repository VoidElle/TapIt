import 'package:flutter/material.dart';
import 'package:tapit/game/local/pages/game_local_page.dart';
import 'package:tapit/game/online/pages/game_online_lobby_page.dart';
import 'package:tapit/game/online/pages/game_online_page.dart';
import 'package:tapit/menu/pages/menu_page.dart';

class GlobalFunctions {

  static MaterialPageRoute generateRoutes(RouteSettings settings) {

    late Widget returnScreen;

    switch (settings.name) {
      case MenuPage.route:
        returnScreen = const MenuPage();
        break;
      case GameOnlinePage.route:
        returnScreen = const GameOnlinePage();
        break;
      case GameOnlineLobbyPage.route:
        returnScreen = const GameOnlineLobbyPage();
        break;
      case GameLocalPage.route:
        returnScreen = const GameLocalPage();
        break;
    }

    return MaterialPageRoute(builder: (_) => returnScreen);
  }

}