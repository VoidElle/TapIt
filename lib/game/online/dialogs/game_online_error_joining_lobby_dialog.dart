import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../global/dialogs/global_error_dialog.dart';

class GameOnlineErrorJoiningLobbyDialog extends StatelessWidget {

  // Message of the error
  final String message;

  const GameOnlineErrorJoiningLobbyDialog({
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlobalErrorDialog(
      title: "Error joining lobby",
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          // Lottie of error icon
          Lottie.asset(
            'assets/lotties/game_online_error_joining_lobby.json',
            repeat: true,
            frameRate: FrameRate.max,
          ),

          // Content text
          Center(
            child: Text(
              message,
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(
            height: 15,
          ),

          // Back to home button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black87,
              backgroundColor: Colors.grey[300],
              minimumSize: const Size(88, 36),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
            ),
            onPressed: () {

              // Pop the dialog
              Navigator.of(context).pop();

            },
            child: const Text(
              'Ok',
            ),
          )

        ],
      ),
    );
  }
}
