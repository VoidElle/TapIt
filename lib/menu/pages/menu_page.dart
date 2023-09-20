import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {

  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          /// The title section
          //const MenuTitle(),

          /// Spacer
          //const GlobalDynamicSpacer(),

          /// Local game button
          /*GlobalAnimatedButton(
            onTapUp: () {
              Navigator.of(context).pushNamed(GameLocalScreen.route);
            },
            child: AutoSizeText(
              "LOCAL",
              maxLines: 1,
              style: GlobalTextStyles.menuScreenButtonTextStyle(),
            ),
          ),*/

          /// Spacer
          //const GlobalDynamicSpacer(),

          /// Online game button
          /*GlobalAnimatedButton(
            onTapUp: () {
              Navigator.of(context).pushNamed(GameOnlineMenuScreen.route);
            },
            child: AutoSizeText(
              "ONLINE",
              maxLines: 1,
              style: GlobalTextStyles.menuScreenButtonTextStyle(),
            ),
          ),*/

          /// Spacer
          //const GlobalDynamicSpacer(),

          /// Tutorial button
          /*GlobalAnimatedButton(
            color: GlobalColorConstants.kRedColor,
            shadowColor: GlobalColorConstants.kDarkRedColor,
            onTapUp: () {
              // Todo
            },
            child: AutoSizeText(
              "TUTORIAL",
              maxLines: 1,
              style: GlobalTextStyles.menuScreenButtonTextStyle(),
            ),
          ),*/

          /// Spacer
          //const GlobalDynamicSpacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// Spacer
              //const GlobalDynamicSpacer(),

              /// Settings button
              /*GlobalAnimatedButton.circular(
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
              ),*/

              /// Spacer
              // const GlobalDynamicSpacer(),

              /// Shop button
              /*GlobalAnimatedButton.circular(
                enabled: false,
                child: Text(
                  "\$",
                  style: GlobalTextStyles.menuScreenButtonTextStyle(),
                ),
                onTapUp: () {
                  // Todo
                },
              ),*/

              /// Spacer
              // const GlobalDynamicSpacer(),

            ],
          ),

          /// Spacer
          // const GlobalDynamicSpacer(),

        ],
      ),
    );
  }

}
