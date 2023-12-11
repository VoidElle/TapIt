import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:tapit/game/online/enums/socket_enums.dart';
import 'package:tapit/global/dialogs/global_error_dialog.dart';
import 'package:tapit/global/dialogs/global_loading_dialog.dart';
import 'package:tapit/global/utils/global_constants.dart';
import 'package:tapit/global/utils/global_functions.dart';

import '../../../global/models/global_socket_model.dart';
import '../../../global/providers/global_socket_provider.dart';
import '../../../global/widgets/global_home_button.dart';

mixin GameOnlineSocketConnectivityChangeListenerMixin {

  bool _isDialogShowingFromListeningProcedure = false;

  void listenSocketConnectivityChange(WidgetRef ref) {

    final GlobalSocketModel globalSocketModel = ref.watch(globalSocketProvider);
    final GameOnlineSocketStatus gameOnlineSocketStatus = globalSocketModel.gameOnlineSocketStatus;

    switch (gameOnlineSocketStatus) {
      case GameOnlineSocketStatus.loading:
        GlobalFunctions.executeAfterBuild(() {
          _showLoadingDialog();
          _isDialogShowingFromListeningProcedure = true;
        });
        break;
      case GameOnlineSocketStatus.error:
      case GameOnlineSocketStatus.disconnected:
        GlobalFunctions.executeAfterBuild(() {
          _showErrorDialog();
          _isDialogShowingFromListeningProcedure = true;
        });
        break;
      default:
        GlobalFunctions.executeAfterBuild(() {
          _isDialogShowingFromListeningProcedure = false;
          GlobalFunctions.pop();
        });
        break;
    }

  }

  void _showLoadingDialog() {

    final BuildContext? context = GlobalConstants.navigatorKey.currentContext;

    if (context == null) {
      debugPrint("Error: Cannot show loading dialog, Context is null!");
      return;
    }

    if (_isDialogShowingFromListeningProcedure) {
      GlobalFunctions.pop();
    }

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext _) => const GlobalLoadingDialog(
        title: "Connecting to servers",
      ),
    );

  }

  void _showErrorDialog() {

    final BuildContext? context = GlobalConstants.navigatorKey.currentContext;

    if (context == null) {
      debugPrint("Error: Cannot show loading dialog, Context is null!");
      return;
    }

    if (_isDialogShowingFromListeningProcedure) {
      GlobalFunctions.pop();
    }

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext _) => GlobalErrorDialog(
        title: "Error",
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Lottie.asset(
              'assets/lotties/tv_no_signal.json',
              repeat: true,
              frameRate: FrameRate.max,
            ),

            const Center(
              child: Text(
                "Connection error\nPlease try again!",
                textAlign: TextAlign.center,
              ),
            ),

            const GlobalHomeButton(
              animated: false,
            ),

          ],
        ),
      ),
    );

  }

}