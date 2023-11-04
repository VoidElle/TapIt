import 'package:flutter/material.dart';

import '../../../../global/utils/global_color_constants.dart';

class GameOnlineLobbyReadyStatusCircular extends StatelessWidget {

  final bool readyStatus;

  const GameOnlineLobbyReadyStatusCircular({
    required this.readyStatus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: readyStatus
            ? GlobalColorConstants.kGreenColor
            : GlobalColorConstants.kRedColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
    );
  }

}
