import 'package:flutter/material.dart';
import 'package:tapit/menu/utils/menu_text_styles.dart';

import '../../global/utils/global_color_constants.dart';

class MenuTitle extends StatelessWidget {

  final String text;
  final double sectionSize;
  final EdgeInsets padding;

  const MenuTitle({
    Key? key,
    this.text = "TAP IT",
    this.sectionSize = 4,
    this.padding = const EdgeInsets.only(top: 20),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      height: deviceHeight / sectionSize,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: GlobalColorConstants.kYellowColor,
      ),
      child: Center(
        child: Padding(
          padding: padding,
          child: FittedBox(
            child: Text(
              text,
              maxLines: 1,
              style: MenuTextStyles.titleTextStyle(),
            ),
          ),
        ),
      ),
    );
  }

}
