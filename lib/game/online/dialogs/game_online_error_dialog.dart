import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tapit/menu/pages/menu_page.dart';

import '../../../global/dialogs/global_error_dialog.dart';
import '../../../global/utils/global_functions.dart';

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

          // Lottie of error icon
          Lottie.asset(
            'assets/lotties/global_error_icon.json',
            repeat: false,
            frameRate: FrameRate.max,
          ),

          // Content text
          const Center(
            child: Text(
              "An error occurred connecting with the servers\nPlease try again",
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

              // Redirect to MenuPage
              GlobalFunctions.redirectAndClearRootTree(MenuPage.route);

            },
            child: const Text(
              'Back to Menu',
            ),
          )

        ],
      ),
    );
  }

}
