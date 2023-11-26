import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:tapit/global/utils/global_enums.dart';
import 'package:tapit/global/utils/global_functions.dart';

class GlobalComplexButton extends StatefulWidget {

  final GlobalComplexButtonType globalComplexButtonType;
  final Function onTapCallback;
  final EdgeInsets padding;
  final bool bypassSvgUseJpg;

  const GlobalComplexButton({
    required this.globalComplexButtonType,
    required this.onTapCallback,
    this.padding = EdgeInsets.zero,
    this.bypassSvgUseJpg = false,
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
        onTapUp: (_) => widget.onTapCallback(),
        child: widget.bypassSvgUseJpg
            ? Image.asset(
                _path!,
              )
            : SvgPicture.asset(
                _path!,
                semanticsLabel: _label,
              ),
      ),
    );
  }
}
