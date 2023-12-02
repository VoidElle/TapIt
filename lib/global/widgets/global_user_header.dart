import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tapit/menu/dialogs/menu_change_language_dialog.dart';

import '../utils/global_constants.dart';
import '../utils/global_functions.dart';

class GlobalUserHeader extends StatelessWidget {

  const GlobalUserHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final Locale currentLocale = GlobalFunctions.getCurrentLocale();

    String? flagPath;
    switch(currentLocale) {
      case GlobalConstants.englishLocale:
        flagPath = "assets/jpgs/global/global_uk_flag.jpg";
        break;
      case GlobalConstants.italianLocale:
        flagPath = "assets/jpgs/global/global_it_flag.jpg";
        break;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(50, 30, 50, 25),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
          border: Border.all(
            width: 5,
            color: const Color(0xFF000000),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 22.5,
            vertical: 12.5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Row(
                children: [

                  Icon(
                    MdiIcons.account,
                    size: 35,
                    color: const Color(0xFF000000),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                      tr("menu_default_nickname"),
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),

                ],
              ),

              if (flagPath != null)
                GestureDetector(
                  onTapUp: (TapUpDetails _) {
                    showDialog(
                      context: context,
                      builder: (BuildContext _) =>
                          const MenuChangeLanguageDialog(),
                    );
                  },
                  child: Image.asset(
                    flagPath,
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }

}
