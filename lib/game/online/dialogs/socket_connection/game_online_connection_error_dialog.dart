import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../global/dialogs/global_error_dialog.dart';
import '../../../../global/widgets/global_home_button.dart';

class GameOnlineConnectionErrorDialog extends StatelessWidget {

  const GameOnlineConnectionErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalErrorDialog(
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
    );
  }

}
