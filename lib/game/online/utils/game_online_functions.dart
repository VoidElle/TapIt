
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../global/utils/global_functions.dart';
import '../dialogs/game_online_error_dialog.dart';
import '../dialogs/game_online_loading_dialog.dart';
import '../pages/game_online_page.dart';
import '../providers/game_online_socket_provider.dart';

class GameOnlineFunctions {

  static Future<String> createLobby(BuildContext context, WidgetRef ref) async {

    final socketNotifier = ref.read(gameOnlineSocketNotifierProvider.notifier);
    socketNotifier.init(context);

    return "";
  }

  static Future<bool> joinLobby(String lobbyId) async {
    return true;
  }

  static void manageSocketStatus(BuildContext context, WidgetRef ref) {

    final Map socketState = ref.watch(gameOnlineSocketNotifierProvider);
    final GameOnlineSocketProviderStatusEnum socketStatus = socketState["status"];

    ref.listen(gameOnlineSocketNotifierProvider, (Map? prev, Map next) {
      final GameOnlineSocketProviderStatusEnum nextStatus = next["status"];
      if (nextStatus == GameOnlineSocketProviderStatusEnum.error || nextStatus == GameOnlineSocketProviderStatusEnum.success) {
        GlobalFunctions.clearAllDialogs(context);
      }
    });

    switch(socketStatus) {
      case GameOnlineSocketProviderStatusEnum.loading:
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext _) => const GameOnlineLoadingDialog(),
          );
        });
        break;
      case GameOnlineSocketProviderStatusEnum.error:
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showDialog(
            context: context,
            builder: (BuildContext _) => const GameOnlineErrorDialog(),
          );
        });
        break;
      case GameOnlineSocketProviderStatusEnum.success:
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushNamed(GameOnlinePage.route);
        });
        break;
      default:
        break;
    }

  }

}