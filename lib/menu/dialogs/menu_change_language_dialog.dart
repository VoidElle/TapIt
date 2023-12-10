import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tapit/global/utils/global_constants.dart';
import 'package:tapit/global/utils/global_functions.dart';

import '../../global/utils/global_color_constants.dart';
import '../../global/widgets/stroke_text.dart';

class MenuChangeLanguageDialog extends StatelessWidget {

  const MenuChangeLanguageDialog({super.key});

  Widget _buildLanguageRow({
    required Function callback,
    required String flagImagePath,
    required String label,
    bool selected = false,
  }) {
    return GestureDetector(
      onTapUp: (TapUpDetails _) async => await callback(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          Image.asset(
            flagImagePath,
            width: 70,
            height: 45,
          ),

          StrokeText(
            text: label,
            textStyle: const TextStyle(
              height: 0.85,
              fontFamily: "CircularStd",
              fontWeight: FontWeight.w900,
              fontSize: 25,
            ),
          ),

          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: selected
                  ? GlobalColorConstants.kGreenColor
                  : GlobalColorConstants.kTransparentColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(50),
              ),
            ),
          ),

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final Locale currentLocale = GlobalFunctions.getCurrentLocale();

    String? flagPath;
    switch(currentLocale) {
      case GlobalConstants.englishLocale:
        flagPath = "assets/jpgs/global/global_uk_flag_big.jpg";
        break;
      case GlobalConstants.italianLocale:
        flagPath = "assets/jpgs/global/global_it_flag_big.jpg";
        break;
    }

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
          left: 20,
          top: 45 + 20,
          right: 20,
          bottom: 20,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 10),
              blurRadius: 10,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              if (flagPath != null)
                Image.asset(
                  flagPath,
                ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 50,
                ),
                child: StrokeText(
                  text: tr("dialog_change_language_title"),
                  textStyle: const TextStyle(
                    height: 0.95,
                    fontFamily: "CircularStd",
                    fontWeight: FontWeight.w900,
                    fontSize: 35,
                  ),
                ),
              ),

              _buildLanguageRow(
                callback: () async {
                  GlobalFunctions.popIfADialogIsShown();
                  await context.setLocale(GlobalConstants.englishLocale);
                },
                flagImagePath: "assets/jpgs/global/global_selector_uk_flag.jpg",
                label: tr("dialog_change_language_english"),
                selected: currentLocale == GlobalConstants.englishLocale,
              ),

              const SizedBox(
                height: 15,
              ),

              _buildLanguageRow(
                callback: () async {
                  GlobalFunctions.popIfADialogIsShown();
                  await context.setLocale(GlobalConstants.italianLocale);
                },
                flagImagePath: "assets/jpgs/global/global_selector_it_flag.jpg",
                label: tr("dialog_change_language_italian"),
                selected: currentLocale == GlobalConstants.italianLocale,
              ),

              const SizedBox(
                height: 50,
              ),

            ],
          ),
        ),
      ),
    );
  }

}
