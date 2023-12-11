import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../global/widgets/global_action_button.dart';

class NewGameOnlineBackButtons extends StatelessWidget {

  final VoidCallback backButtonCallback;
  final VoidCallback homeButtonCallback;

  const NewGameOnlineBackButtons({
    super.key,
    required this.backButtonCallback,
    required this.homeButtonCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        GlobalActionButton(
          iconData: MdiIcons.arrowLeftBold,
          padding: const EdgeInsets.only(
            bottom: 75,
          ),
          animated: true,
          voidCallback: backButtonCallback,
        ),

        const SizedBox(
          width: 50,
        ),

        GlobalActionButton(
          iconData: MdiIcons.home,
          padding: const EdgeInsets.only(
            bottom: 75,
          ),
          animated: true,
          voidCallback: homeButtonCallback,
        ),

      ],
    );
  }

}
