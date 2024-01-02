import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/dialogs/game_online_error_dialog.dart';
import 'package:tapit/game/online/dialogs/game_online_loading_dialog.dart';
import 'package:tapit/game/online/models/game/game_online_game_model.dart';
import 'package:tapit/game/online/models/socket/game_online_socket_model.dart';
import 'package:tapit/global/utils/global_functions.dart';

import '../../../global/utils/global_color_constants.dart';
import '../../../global/utils/global_constants.dart';
import '../enums/socket_enums.dart';
import '../../../global/providers/global_socket_provider.dart';
import '../models/player/game_online_player_model.dart';
import '../providers/game_online_game_provider.dart';

class GameOnlineFunctions {

  // Function to initialize the socket connection with the server
  static void initSocketConnection(WidgetRef ref) {
    ref.read(globalSocketProvider.notifier).init();
  }

  // Function to manage the Socket status from the Menu screen
  static void manageSocketStatusFromMenu(GameOnlineSocketStatus gameOnlineSocketStatus, BuildContext context) {

    debugPrint("GameOnlineSocketStatus -> ${gameOnlineSocketStatus.toString()}");

    // Pop a dialog if it's currently showing
    GlobalFunctions.popIfADialogIsShown();

    switch(gameOnlineSocketStatus) {
      case GameOnlineSocketStatus.loading:

        // If the socket's current status is Loading,
        // show the loading dialog
        GlobalFunctions.executeAfterBuild(() {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext _) => const GameOnlineLoadingDialog(),
          );
        });

        break;
      case GameOnlineSocketStatus.success:

        // If the socket's current status is Success,
        // pop the currently showing dialog
        // (it should be the loading one, or also the error one)
        GlobalFunctions.popIfADialogIsShown();

        break;
      case GameOnlineSocketStatus.error:
      case GameOnlineSocketStatus.disconnected:

        // If the socket's current status is Error or Disconnected,
        // show the error dialog
        GlobalFunctions.executeAfterBuild(() {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext _) => const GameOnlineErrorDialog(),
          );
        });

        break;
      default:
        break;
    }

  }

  static void manageSocketStatusFromGame() {}

  // Function to get if all the player are ready
  static bool areAllPlayersReady(List<GameOnlinePlayerModel> gameOnlinePlayerModelList) {

    for (GameOnlinePlayerModel gameOnlinePlayerModel in gameOnlinePlayerModelList) {

      // If we find a socket that is not ready, we return false
      if (!gameOnlinePlayerModel.readyStatus) {
        return false;
      }

    }

    return gameOnlinePlayerModelList.isNotEmpty;
  }

  // Function that returns a list of players without a player with a specified socket id
  static List<GameOnlinePlayerModel> removePlayerFromList(String socketId, List<GameOnlinePlayerModel> gameOnlinePlayerModelList) {
    return gameOnlinePlayerModelList.where((GameOnlinePlayerModel gameOnlinePlayerModel) => gameOnlinePlayerModel.gameOnlineSocketModel.socketId != socketId).toList();
  }

  static GameOnlineGameModel gameOnlineGameModelBuilderFromJson(Map<String, dynamic> json) {

    final String lobbyId = json["lobbyId"];
    final List<dynamic> socketsToParse = json["sockets"];

    final List<GameOnlinePlayerModel> players = [];

    for (Map<String, dynamic> socketToParse in socketsToParse) {
      players.add(
        GameOnlinePlayerModel(
          gameOnlineSocketModel: GameOnlineSocketModel.fromJson(socketToParse),
          colorValue: socketToParse["socketId"] == socketsToParse.first["socketId"]
              ? GlobalColorConstants.kBlueColor.value
              : GlobalColorConstants.kRedColor.value,
        ),
      );
    }

    final GameOnlineGameModel gameOnlineGameModel = GameOnlineGameModel(
      lobbyId: lobbyId,
      players: players,
    );

    return gameOnlineGameModel;
  }

  static void createAndSetNewGameModel(Map<String, dynamic> jsonReceived, WidgetRef ref) {

    // Create the new game model
    final GameOnlineGameModel gameOnlineGameModel = GameOnlineFunctions.gameOnlineGameModelBuilderFromJson(jsonReceived);

    // Get the notifier of the Online Game
    final gameOnlineGameStateNotifier = ref.read(gameOnlineGameProvider.notifier);

    // Set the new game model
    gameOnlineGameStateNotifier.setGameModel(gameOnlineGameModel);

  }

  static void showErrorTopSnackBar({
    required String title,
    required String subtitle,
    Duration duration = const Duration(
      seconds: 3,
    ),
    EdgeInsets margin = const EdgeInsets.all(8),
  }) {

    final BuildContext? context = GlobalConstants.navigatorKey.currentContext;

    if (context == null) {
      debugPrint("Error: Cannot show loading dialog, Context is null!");
      return;
    }

    // Check if the Flushbar was set before this run
    final bool firstRun = GlobalConstants.flushbar == null;

    // Set the Flushbar only if it is wasn't set before
    GlobalConstants.flushbar ??= Flushbar(
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: FlushbarPosition.TOP,
      duration: duration,
      icon: const Padding(
        padding: EdgeInsets.only(
          left: 15,
        ),
        child: Icon(
          Icons.error_outline,
          color: GlobalColorConstants.kWhiteColor,
        ),
      ),
      isDismissible: true,
      title: title,
      message: subtitle,
      margin: margin,
      borderRadius: BorderRadius.circular(8),
    );

    // Dismiss the flushbar if it was showing before
    GlobalConstants.flushbar!.dismiss();

    // Show the flushbar
    Future.delayed(Duration(seconds: firstRun ? 0 : 1), () {
      GlobalConstants.flushbar!.show(context);
    });

  }

}