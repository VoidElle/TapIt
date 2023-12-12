import 'package:flutter/material.dart';

import '../../../../global/dialogs/global_loading_dialog.dart';

class GameOnlineConnectionLoadingDialog extends StatelessWidget {

  const GameOnlineConnectionLoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlobalLoadingDialog(
      title: "Connecting to servers",
    );
  }

}
