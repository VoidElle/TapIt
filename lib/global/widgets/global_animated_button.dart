import 'package:flutter/material.dart';

import '../utils/global_color_constants.dart';

class GlobalAnimatedButton extends StatefulWidget {

  final VoidCallback onTapUp;
  final Widget child;
  final bool enabled, circular, canBePressed;
  final EdgeInsets padding;
  final Color color, shadowColor;
  final double height, width;
  final Duration animationDuration;

  const GlobalAnimatedButton({
    Key? key,
    required this.onTapUp,
    required this.child,
    this.enabled = true,
    this.circular = false,
    this.padding = const EdgeInsets.fromLTRB(15, 5, 15, 0),
    this.color = GlobalColorConstants.kBlueColor,
    this.shadowColor = GlobalColorConstants.kDarkBlueColor,
    this.height = 80,
    this.width = 250,
    this.canBePressed = true,
    this.animationDuration = const Duration(milliseconds: 70),
  }) : super(key: key);

  const GlobalAnimatedButton.circular({
    Key? key,
    required this.onTapUp,
    required this.child,
    this.enabled = true,
    this.circular = true,
    this.padding = const EdgeInsets.fromLTRB(15, 10, 15, 0),
    this.color = GlobalColorConstants.kGreenColor,
    this.shadowColor = GlobalColorConstants.kDarkGreenColor,
    this.height = 85,
    this.width = 87,
    this.canBePressed = true,
    this.animationDuration = const Duration(milliseconds: 70),
  }) : super(key: key);

  @override
  State<GlobalAnimatedButton> createState() => _GlobalAnimatedButtonState();
}

class _GlobalAnimatedButtonState extends State<GlobalAnimatedButton> {

  /// The type of the animation
  final Curve _animationCurve = Curves.easeIn;

  /// The height of the shadow of the button
  final int _shadowHeight = 4;

  /// The position of the button (pressed or not)
  double _position = 4;

  /// The function that will be executed at the press of the button
  void _pressed(_) {
    if (widget.canBePressed) {
      setState(() => _position = -4);
    }
  }

  /// The function that will be executed at the unpress of the button
  void _unPressedTapUp(_) => _unPressed();

  /// The function that will be executed at the unpress of the button
  void _unPressed() {
    if (widget.canBePressed) {
      setState(() => _position = 4);
      widget.onTapUp();
    }
  }

  @override
  Widget build(BuildContext context) {

    /// The height without the shadow
    final double heightWithoutShadow = widget.height - _shadowHeight;

    return GestureDetector(
      onTapDown: _pressed,
      onTapUp: _unPressedTapUp,
      onTapCancel: _unPressed,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [

            /// The bottom part of the button
            Positioned(
              bottom: -8,
              child: Container(
                height: heightWithoutShadow,
                width: widget.width,
                decoration: BoxDecoration(
                  color: (widget.enabled)
                      ? widget.shadowColor
                      : GlobalColorConstants.kDarkGreyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      (widget.circular)
                          ? 40
                          : 30,
                    ),
                  ),
                ),
              ),
            ),

            /// The top part of the button
            AnimatedPositioned(
              curve: _animationCurve,
              duration: widget.animationDuration,
              bottom: _position,
              child: Container(
                height: heightWithoutShadow,
                width: widget.width,
                decoration: BoxDecoration(
                  color: (widget.enabled)
                      ? widget.color
                      : GlobalColorConstants.kGreyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      (widget.circular)
                          ? 40
                          : 27,
                    ),
                  ),
                ),
                child: Container(
                  padding: widget.padding,
                  child: Center(
                    child: widget.child,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

}
