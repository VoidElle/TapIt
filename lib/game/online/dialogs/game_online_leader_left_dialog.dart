import 'package:flutter/material.dart';

import '../../../global/dialogs/global_error_dialog.dart';
import '../../../global/utils/global_functions.dart';
import '../../../menu/pages/menu_page.dart';

class GameOnlineLeaderLeftDialog extends StatelessWidget {

  const GameOnlineLeaderLeftDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalErrorDialog(
      title: "Leader left",
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          // Content text
          const Center(
            child: Text(
              "The leader of this lobby has left\nThe game has been canceled.",
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
