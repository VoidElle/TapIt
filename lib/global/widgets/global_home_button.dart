import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../menu/pages/menu_page.dart';
import '../utils/global_functions.dart';
import 'global_action_button.dart';

class GlobalHomeButton extends StatelessWidget {

  final bool animated;

  const GlobalHomeButton({
    this.animated = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlobalActionButton(
      iconData: MdiIcons.home,
      padding: const EdgeInsets.symmetric(
        vertical: 25,
      ),
      animated: animated,
      voidCallback: () {

        // Redirect to the Menu page
        GlobalFunctions.redirectAndClearRootTree(MenuPage.route);

      },
    );
  }

}
