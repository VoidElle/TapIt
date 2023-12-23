import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/online/enums/socket_enums.dart';
import 'package:tapit/global/utils/global_functions.dart';

import '../../../../global/models/global_socket_model.dart';
import '../../../../global/providers/global_socket_provider.dart';

mixin GameOnlineSocketConnectivityChangeListenerMixin {

  bool _isDialogShowingFromListeningProcedure = false;

  void listenSocketConnectivityChange({
    required WidgetRef ref,
  }) {

    final GlobalSocketModel globalSocketModel = ref.watch(globalSocketProvider);
    final GameOnlineSocketStatus gameOnlineSocketStatus = globalSocketModel.gameOnlineSocketStatus;

    switch (gameOnlineSocketStatus) {
      case GameOnlineSocketStatus.loading:
        GlobalFunctions.executeAfterBuild(() {

          // Show loading dialog
          GlobalFunctions.showLoadingDialog(
            shouldPopBefore: _isDialogShowingFromListeningProcedure,
          );

          _isDialogShowingFromListeningProcedure = true;
        });
        break;
      case GameOnlineSocketStatus.error:
      case GameOnlineSocketStatus.disconnected:
        GlobalFunctions.executeAfterBuild(() {

          // Show connectivity error dialog
          GlobalFunctions.showConnectivityErrorDialog(
            shouldPopBefore: _isDialogShowingFromListeningProcedure,
          );

          _isDialogShowingFromListeningProcedure = true;
        });
        break;
      default:
        GlobalFunctions.executeAfterBuild(() {
          if (_isDialogShowingFromListeningProcedure) {
            _isDialogShowingFromListeningProcedure = false;
            GlobalFunctions.pop();
          }
        });
        break;
    }

  }

}