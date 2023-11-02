import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/dialogs/game_online_error_dialog.dart';
import 'package:tapit/game/online/dialogs/game_online_loading_dialog.dart';
import 'package:tapit/global/utils/global_functions.dart';

import '../enums/socket_enums.dart';
import '../providers/game_online_socket_provider.dart';

class GameOnlineFunctions {

  static void initSocketConnection(WidgetRef ref) {
    ref.read(gameOnlineSocketProvider.notifier).init();
  }

  static void manageSocketStatusFromMenu(GameOnlineSocketStatus gameOnlineSocketStatus, BuildContext context) {

    debugPrint("GameOnlineSocketStatus -> ${gameOnlineSocketStatus.toString()}");

    GlobalFunctions.popIfADialogIsShown(context);

    switch(gameOnlineSocketStatus) {
      case GameOnlineSocketStatus.loading:
        GlobalFunctions.executeAfterBuild(() {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext _) => const GameOnlineLoadingDialog(),
          );
        });
        break;
      case GameOnlineSocketStatus.success:
        GlobalFunctions.popIfADialogIsShown(context);
        break;
      case GameOnlineSocketStatus.error:
      case GameOnlineSocketStatus.disconnected:
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

  static void manageSocketStatusFromGame() {

  }

  static Future<String> createLobby() async {
    return "";
  }

  static Future<bool> joinLobby(String lobbyId) async {
    return true;
  }

}