import 'package:flutter/material.dart';

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
      onTapUp: (TapUpDetails _) => callback(),
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
            textAlign: TextAlign.center,
            textColor: const Color(0xFFFFFFFF),
            textStyle: const TextStyle(
              height: 0.85,
              fontFamily: "CircularStd",
              fontWeight: FontWeight.w900,
              fontSize: 25,
            ),
            strokeColor: const Color(0xFF000000),
            strokeWidth: 6,
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

              Image.asset(
                "assets/jpgs/global/global_uk_flag_big.jpg",
              ),

              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 50,
                ),
                child: StrokeText(
                  text: "SELECT THE\nLANGUAGE",
                  textAlign: TextAlign.center,
                  textColor: Color(0xFFFFFFFF),
                  textStyle: TextStyle(
                    height: 0.95,
                    fontFamily: "CircularStd",
                    fontWeight: FontWeight.w900,
                    fontSize: 35,
                  ),
                  strokeColor: Color(0xFF000000),
                  strokeWidth: 6,
                ),
              ),

              _buildLanguageRow(
                callback: () {

                },
                flagImagePath: "assets/jpgs/global/global_selector_uk_flag.jpg",
                label: "English".toUpperCase(),
                selected: true,
              ),

              const SizedBox(
                height: 15,
              ),

              _buildLanguageRow(
                callback: () {

                },
                flagImagePath: "assets/jpgs/global/global_selector_it_flag.jpg",
                label: "Italian".toUpperCase(),
                selected: false,
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
