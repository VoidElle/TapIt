import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:tapit/game/local/pages/game_local_page.dart';
import 'package:tapit/game/online/models/game/game_online_game_model.dart';
import 'package:tapit/game/online/models/lobby/game_online_lobby_model.dart';
import 'package:tapit/game/online/pages/game_online_join_lobby_page.dart';
import 'package:tapit/game/online/pages/game_online_lobby_page.dart';
import 'package:tapit/game/online/pages/game_online_menu_page.dart';
import 'package:tapit/game/online/pages/game_online_page.dart';
import 'package:tapit/game/online/pages/new/new_game_online_lobby_page.dart';
import 'package:tapit/game/online/pages/new/new_game_online_join_page.dart';
import 'package:tapit/game/online/pages/new/new_game_online_page.dart';
import 'package:tapit/global/utils/global_constants.dart';
import 'package:tapit/global/utils/global_enums.dart';
import 'package:tapit/menu/pages/menu_page.dart';

import '../../game/online/dialogs/socket_connection/game_online_connection_error_dialog.dart';
import '../../game/online/dialogs/socket_connection/game_online_connection_loading_dialog.dart';
import '../dialogs/global_error_dialog.dart';
import 'global_paths.dart';

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
      case NewGameOnlineLobbyPage.route:
        returnScreen = const NewGameOnlineLobbyPage();
        break;
      case NewGameOnlineJoinPage.route:
        returnScreen = const NewGameOnlineJoinPage();
        break;
      case MenuPage.route:
        returnScreen = const MenuPage();
        break;
      case GameOnlinePage.route:

        final GameOnlineGameModel gameModel = arguments!["game_model"];

        returnScreen = GameOnlinePage(
          gameModel: gameModel,
        );

        break;
      case NewGameOnlinePage.route:
        returnScreen = const NewGameOnlinePage();
        break;
      case GameOnlineMenuPage.route:
        returnScreen = const GameOnlineMenuPage();
        break;
      case GameLocalPage.route:
        returnScreen = const GameLocalPage();
        break;
      case GameOnlineLobbyPage.route:

        final GameOnlineLobbyModel gameOnlineLobbyModel = arguments!["data"];

        returnScreen = GameOnlineLobbyPage(
          gameOnlineLobbyModel: gameOnlineLobbyModel,
        );

        break;
      case GameOnlineJoinLobbyPage.route:
        returnScreen = const GameOnlineJoinLobbyPage();
        break;
    }

    return MaterialPageRoute(builder: (_) => returnScreen);
  }

  // Function to redirect to a route
  static void redirect(String route, {Map? arguments}) {
    GlobalConstants.navigatorKey.currentState?.pushReplacementNamed(route, arguments: arguments);
  }

  // Function to redirect to a route and remove all the pages below
  static void redirectAndClearRootTree(String route, {Map? arguments}) {
    GlobalConstants.navigatorKey.currentState?.pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false, arguments: arguments);;
  }

  static void pop() {
    final BuildContext? context = GlobalConstants.navigatorKey.currentState?.context;
    if (context != null) {
      GlobalConstants.navigatorKey.currentState?.pop();
    }
  }

  // Function to pop a dialog if it's displayed
  static void popIfADialogIsShown() {
    final BuildContext? context = GlobalConstants.navigatorKey.currentState?.context;
    if (context != null && _isThereCurrentDialogShowing(context)) {
      GlobalConstants.navigatorKey.currentState?.pop();
    }
  }

  // Function to check if a dialog is displayed
  static bool _isThereCurrentDialogShowing(BuildContext context) => ModalRoute.of(context)?.isCurrent != true;

  // Function to get the path image from the GlobalComplexButtonType
  static String getComplexButtonPathImageFromType(GlobalComplexButtonType globalComplexButtonType) {

    final Locale currentLocale = GlobalFunctions.getCurrentLocale();

    String? dir = "";
    switch(currentLocale) {
      case GlobalConstants.englishLocale:
        dir = "en";
        break;
      case GlobalConstants.italianLocale:
        dir = "it";
        break;
    }

    switch(globalComplexButtonType) {
      case GlobalComplexButtonType.local:
        return GlobalPaths.svgMenuLocalButtonPath.replaceAll("%language%", dir);
      case GlobalComplexButtonType.online:
        return GlobalPaths.svgMenuOnlineButtonPath.replaceAll("%language%", dir);
      case GlobalComplexButtonType.shop:
        return GlobalPaths.jpgMenuShopButtonPath.replaceAll("%language%", dir);
      case GlobalComplexButtonType.createGame:
        return GlobalPaths.svgOnlineGameCreateButtonPath.replaceAll("%language%", dir);
      case GlobalComplexButtonType.joinGame:
        return GlobalPaths.svgOnlineGameJoinButtonPath.replaceAll("%language%", dir);
      case GlobalComplexButtonType.joinGameFromPin:
        return GlobalPaths.svgOnlineGameJoinFromPinButtonPath.replaceAll("%language%", dir);
    }

  }

  // Function to get the label from the GlobalComplexButtonType
  static String getComplexButtonLabelFromType(GlobalComplexButtonType globalComplexButtonType) {
    switch(globalComplexButtonType) {
      case GlobalComplexButtonType.local:
        return "Local button";
      case GlobalComplexButtonType.online:
        return "Online button";
      case GlobalComplexButtonType.shop:
        return "Shop button";
      case GlobalComplexButtonType.createGame:
        return "Create lobby button";
      case GlobalComplexButtonType.joinGame:
        return "Join lobby button";
      case GlobalComplexButtonType.joinGameFromPin:
        return "Join game button";
    }
  }

  static Locale getCurrentLocale() {
    return GlobalConstants.navigatorKey.currentState!.context.locale;
  }

  static void showLoadingDialog({
    required bool shouldPopBefore,
  }) {
    final BuildContext? context = GlobalConstants.navigatorKey.currentContext;

    if (context == null) {
      debugPrint("Error: Cannot show loading dialog, Context is null!");
      return;
    }

    if (shouldPopBefore) {
      GlobalFunctions.pop();
    }

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext _) => const GameOnlineConnectionLoadingDialog(),
    );

  }

  static void showConnectivityErrorDialog({
    required bool shouldPopBefore,
  }) {
    final BuildContext? context = GlobalConstants.navigatorKey.currentContext;

    if (context == null) {
      debugPrint("Error: Cannot show loading dialog, Context is null!");
      return;
    }

    if (shouldPopBefore) {
      GlobalFunctions.pop();
    }

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext _) => const GameOnlineConnectionErrorDialog(),
    );

  }

  static void showErrorDialog({
    required bool shouldPopBefore,
    required String error,
    required String content,
  }) {
    final BuildContext? context = GlobalConstants.navigatorKey.currentContext;

    if (context == null) {
      debugPrint("Error: Cannot show loading dialog, Context is null!");
      return;
    }

    if (shouldPopBefore) {
      GlobalFunctions.pop();
    }

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext _) => GlobalErrorDialog(
        title: error,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                content,
              ),
            ),
          ],
        ),
      ),
    );

  }

}