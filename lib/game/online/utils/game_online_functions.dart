import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/dialogs/game_online_error_dialog.dart';
import 'package:tapit/game/online/dialogs/game_online_loading_dialog.dart';
import 'package:tapit/game/online/models/socket/game_online_socket_model.dart';
import 'package:tapit/global/utils/global_functions.dart';

import '../enums/socket_enums.dart';
import '../../../global/providers/global_socket_provider.dart';

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

  // Function to get if all the sockets are ready
  static bool areAllSocketsReady(List<GameOnlineSocketModel> gameOnlineSocketModelList) {

    for (GameOnlineSocketModel gameOnlineSocketModel in gameOnlineSocketModelList) {

      // If we find a socket that is not ready, we return false
      if (!gameOnlineSocketModel.readyStatus) {
        return false;
      }

    }

    return gameOnlineSocketModelList.isNotEmpty;
  }

}