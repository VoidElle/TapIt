import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:tapit/global/utils/global_constants.dart';
import 'package:tapit/global/utils/global_enums.dart';
import 'package:tapit/global/utils/global_functions.dart';
import 'package:tapit/global/utils/managers/global_shared_preferences_manager.dart';
import 'package:tapit/global/utils/managers/global_sounds_manager.dart';

import '../dialogs/global_disabled_section_dialog.dart';

class GlobalComplexButton extends StatefulWidget {

  final int i;
  final GlobalComplexButtonType globalComplexButtonType;
  final Function onTapCallback;
  final EdgeInsets padding;
  final bool bypassSvgUseJpg;
  final bool makeSound;
  final bool enabled;

  const GlobalComplexButton({
    this.i = 0,
    required this.globalComplexButtonType,
    required this.onTapCallback,
    this.padding = EdgeInsets.zero,
    this.bypassSvgUseJpg = false,
    this.makeSound = true,
    this.enabled = true,
    super.key,
  });

  @override
  State<GlobalComplexButton> createState() => _GlobalComplexButtonState();
}

class _GlobalComplexButtonState extends State<GlobalComplexButton> {

  final Logger _logger = Logger();

  String? _path;
  String? _label;

  @override
  void initState() {

    // Get the path and label using the widget GlobalComplexButtonType
    _path = GlobalFunctions.getComplexButtonPathImageFromType(widget.globalComplexButtonType);
    _label = GlobalFunctions.getComplexButtonLabelFromType(widget.globalComplexButtonType);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    // Log and return an error text if the path or the label is null,
    // so it cannot be converted
    if (_path == null || _label == null) {
      _logger.e("There was an error converting the GlobalComplexButtonType (${widget.globalComplexButtonType}) to an image button.}");
      return const Text(
        "There was an error loading this button",
      );
    }

    // Return the button
    return Padding(
      padding: widget.padding,
      child: GestureDetector(
        onTapUp: (_) async {

          final GlobalSharedPreferencesManager globalSharedPreferencesManager = GlobalConstants.globalSharedPreferencesManager;
          final GlobalSoundsManager globalSoundsManager = GlobalConstants.globalSoundsManager;

          if (globalSharedPreferencesManager.getFxSoundsEnabled()) {
            await globalSoundsManager.playMenuTapFx();
          }

          if (!widget.enabled) {
            if (context.mounted) {
              showDialog(
                context: context,
                builder: (BuildContext _) => const GlobalDisabledSectionDialog(),
              );
            }
            return;
          }

          widget.onTapCallback();
        },
        child: Opacity(
          opacity: widget.enabled ? 1 : .6,
          child: widget.bypassSvgUseJpg
              ? Image.asset(
                  _path!,
                )
              : SvgPicture.asset(
                  _path!,
                  semanticsLabel: _label,
                ),
        ),
      ),
    )
        .animate()
        .fadeIn(
          delay: Duration(milliseconds: 100 * (widget.i + 1)),
        )
        .slideX(
          delay: Duration(milliseconds: 100 * (widget.i + 1)),
          curve: Curves.easeOut,
        )
        .animate()
        .shimmer(
          duration: Duration(seconds: widget.enabled ? 1 : 0),
        );

  }
}
