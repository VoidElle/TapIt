import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tapit/game/local/pages/game_local_page.dart';
import 'package:tapit/game/online/pages/game_online_menu_page.dart';
import 'package:tapit/game/online/pages/game_online_page.dart';
import 'package:tapit/menu/pages/menu_page.dart';

class GlobalFunctions {

  static void executeAfterBuild(Function function) {
    SchedulerBinding.instance.addPostFrameCallback((_) => function());
  }

  static MaterialPageRoute generateRoutes(RouteSettings settings) {

    late Widget returnScreen;

    switch (settings.name) {
      case MenuPage.route:
        returnScreen = const MenuPage();
        break;
      case GameOnlinePage.route:
        returnScreen = const GameOnlinePage();
        break;
      case GameOnlineMenuPage.route:
        returnScreen = const GameOnlineMenuPage();
        break;
      case GameLocalPage.route:
        returnScreen = const GameLocalPage();
        break;
    }

    return MaterialPageRoute(builder: (_) => returnScreen);
  }

  static void redirectAndClearRootTree(BuildContext context, String route) {
    Navigator.of(context).pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
  }

  static void popIfADialogIsShown(BuildContext context) {
    if (_isThereCurrentDialogShowing(context)) {
      Navigator.of(context).pop();
    }
  }

  static bool _isThereCurrentDialogShowing(BuildContext context) => ModalRoute.of(context)?.isCurrent != true;

}