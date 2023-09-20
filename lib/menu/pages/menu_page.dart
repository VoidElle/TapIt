import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tapit/global/utils/global_color_constants.dart';
import 'package:tapit/global/widgets/global_dynamic_spacer.dart';
import 'package:tapit/menu/utils/menu_text_styles.dart';
import 'package:tapit/menu/widgets/menu_title.dart';

import '../../global/widgets/global_animated_button.dart';

class MenuPage extends StatelessWidget {

  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          /// The title section
          const MenuTitle(),

          /// Spacer
          const GlobalDynamicSpacer(),

          /// Local game button
          GlobalAnimatedButton(
            onTapUp: () {
              // Navigator.of(context).pushNamed(GameLocalScreen.route);
            },
            child: AutoSizeText(
              "LOCAL",
              maxLines: 1,
              style: MenuTextStyles.buttonTextStyle(),
            ),
          ),

          /// Spacer
          const GlobalDynamicSpacer(),

          /// Online game button
          GlobalAnimatedButton(
            onTapUp: () {
              // Navigator.of(context).pushNamed(GameOnlineMenuScreen.route);
            },
            child: AutoSizeText(
              "ONLINE",
              maxLines: 1,
              style: MenuTextStyles.buttonTextStyle(),
            ),
          ),

          /// Spacer
          const GlobalDynamicSpacer(),

          /// Tutorial button
          GlobalAnimatedButton(
            color: GlobalColorConstants.kRedColor,
            shadowColor: GlobalColorConstants.kDarkRedColor,
            onTapUp: () {
              // Todo
            },
            child: AutoSizeText(
              "SHOP",
              maxLines: 1,
              style: MenuTextStyles.buttonTextStyle(),
            ),
          ),

          /// Spacer
          const GlobalDynamicSpacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// Settings button
              GlobalAnimatedButton.circular(
                child: const Padding(
                  padding: EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Icon(
                    Icons.settings,
                    color: GlobalColorConstants.kBlackColor,
                    size: 40,
                  ),
                ),
                onTapUp: () {
                  // Todo
                },
              ),

            ],
          ),

          /// Spacer
          const GlobalDynamicSpacer(),

        ],
      ),
    );
  }

}
