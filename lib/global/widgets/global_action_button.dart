import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../utils/global_constants.dart';
import '../utils/managers/global_shared_preferences_manager.dart';
import '../utils/managers/global_sounds_manager.dart';

class GlobalActionButton extends StatelessWidget {

  final IconData iconData;
  final VoidCallback voidCallback;
  final bool fromEnabled;
  final bool animated;
  final EdgeInsets padding;

  const GlobalActionButton({
    required this.iconData,
    required this.voidCallback,
    this.fromEnabled = true,
    this.animated = false,
    this.padding = const EdgeInsets.all(0),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTapUp: (TapUpDetails _) async {

          final GlobalSharedPreferencesManager globalSharedPreferencesManager = GlobalConstants.globalSharedPreferencesManager;
          final GlobalSoundsManager globalSoundsManager = GlobalConstants.globalSoundsManager;

          if (globalSharedPreferencesManager.getFxSoundsEnabled()) {
            await globalSoundsManager.playMenuTapFx();
          }

          voidCallback();
        },
        child: Container(
          height: fromEnabled
              ? 70
              : 60,
          width: fromEnabled
              ? 70
              : 60,
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
              size: fromEnabled
                  ? 32.5
                  : 27.5,
              color: const Color(0xFF000000),
            )
          ),
        ),
      )
          .animate()
          .fadeIn(
            delay: Duration(
              milliseconds: animated ? 100 : 0,
            ),
          )
          .slideX(
            delay: Duration(
              milliseconds: animated ? 100 : 0,
            ),
            curve: Curves.easeOut,
          ),
    );
  }

}
