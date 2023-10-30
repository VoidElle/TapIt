import 'package:flutter/material.dart';

import '../../../global/dialogs/global_loading_dialog.dart';

class GameOnlineLoadingDialog extends StatelessWidget {

  const GameOnlineLoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const GlobalLoadingDialog(
      title: "Loading",
      description: "Connecting with servers...",
    );
  }

}
