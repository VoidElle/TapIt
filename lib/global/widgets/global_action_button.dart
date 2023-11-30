import 'package:flutter/material.dart';

class GlobalActionButton extends StatelessWidget {

  final IconData iconData;
  final VoidCallback voidCallback;

  const GlobalActionButton({
    required this.iconData,
    required this.voidCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (TapUpDetails _) => voidCallback(),
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: const Color(0xFF50D37A),
          borderRadius: const BorderRadius.all(
            Radius.circular(12.5),
          ),
          border: Border.all(
            color: const Color(0xFF000000),
            width: 5,
          )
        ),
        child: Center(
          child: Icon(
            iconData,
            size: 32.5,
            color: const Color(0xFF000000),
          )
        ),
      ),
    );
  }

}
