import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tapit/game/local/pages/game_local_page.dart';
import 'package:tapit/game/online/pages/game_online_lobby_page.dart';
import 'package:tapit/game/online/pages/game_online_menu_page.dart';
import 'package:tapit/game/online/pages/game_online_page.dart';
import 'package:tapit/menu/pages/menu_page.dart';

class GlobalFunctions {

  // Function to execute a given function after the build() of a widget function get executed
  static void executeAfterBuild(Function function) {
    SchedulerBinding.instance.addPostFrameCallback((_) => function());
  }

  // Function to manage the routes
  static MaterialPageRoute generateRoutes(RouteSettings settings) {

    late Widget returnScreen;
    final Map? arguments = settings.arguments as Map?;

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
      case GameOnlineLobbyPage.route:

        final bool isJoined = arguments!["is_joined"] ?? false;
        final String? lobbyId = arguments["lobby_id"];

        returnScreen = GameOnlineLobbyPage(
          isJoined: isJoined,
          lobbyId: lobbyId,
        );

        break;
    }

    return MaterialPageRoute(builder: (_) => returnScreen);
  }

  // Function to redirect to a route
  static void redirect(BuildContext context, String route, {Map? arguments}) {
    Navigator.of(context).pushReplacementNamed(route, arguments: arguments);
  }

  // Function to redirect to a route and remove all the pages below
  static void redirectAndClearRootTree(BuildContext context, String route, {Map? arguments}) {
    Navigator.of(context).pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false, arguments: arguments);
  }

  // Function to pop a dialog if it's displayed
  static void popIfADialogIsShown(BuildContext context) {
    if (_isThereCurrentDialogShowing(context)) {
      Navigator.of(context).pop();
    }
  }

  // Function to check if a dialog is displayed
  static bool _isThereCurrentDialogShowing(BuildContext context) => ModalRoute.of(context)?.isCurrent != true;

}