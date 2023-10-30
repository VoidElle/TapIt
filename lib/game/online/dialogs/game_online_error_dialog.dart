import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../global/dialogs/global_error_dialog.dart';

class GameOnlineErrorDialog extends StatelessWidget {

  const GameOnlineErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalErrorDialog(
      title: "Error",
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Lottie.asset(
            'assets/lotties/global_error_icon.json',
            repeat: false,
            frameRate: FrameRate.max,
          ),

          const Center(
            child: Text(
              "An error occurred connecting with the servers\nPlease try again",
              textAlign: TextAlign.center,
            ),
          ),

        ],
      ),
    );
  }

}
