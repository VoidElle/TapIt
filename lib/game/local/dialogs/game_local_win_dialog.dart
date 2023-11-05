import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/game/local/providers/game_local_game_status_provider.dart';
import 'package:tapit/game/local/utils/game_local_text_styles.dart';
import 'package:tapit/global/utils/global_functions.dart';
import 'package:tapit/menu/pages/menu_page.dart';

import '../utils/game_local_enums.dart';
import '../utils/game_local_functions.dart';

class GameLocalWinDialog extends ConsumerStatefulWidget {

  final GameLocalPlayerEnum gameLocalPlayerEnum;
  final Color winnerColor;

  const GameLocalWinDialog({
    super.key,
    required this.gameLocalPlayerEnum,
    required this.winnerColor,
  });

  @override
  ConsumerState<GameLocalWinDialog> createState() => _GameLocalWinDialogState();
}

class _GameLocalWinDialogState extends ConsumerState<GameLocalWinDialog> {

  @override
  void initState() {

    super.initState();

    // Set the player won state to true to show the confetti
    GlobalFunctions.executeAfterBuild(() {
      ref.read(gameLocalGameStatusProvider.notifier).setPlayerWon(true);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [

          Container(
            padding: const EdgeInsets.only(
              left: 20,
              top: 45 + 20,
              right: 20,
              bottom: 20,
            ),
            margin: const EdgeInsets.only(top: 45),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                Text(
                  "Game Over!",
                  style: GameLocalTextStyles.winDialogTitleTextStyle(),
                ),

                const SizedBox(
                  height: 15,
                ),

                Text(
                  "${widget.gameLocalPlayerEnum.text} player won the game",
                  style: GameLocalTextStyles.winDialogBodyTextStyle(),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(
                  height: 22,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    TextButton(
                      onPressed: () {

                        // Reset the providers of the match
                        GameLocalFunctions.resetProviders(ref);

                        // Redirect to the Menu page
                        GlobalFunctions.redirect(context, MenuPage.route);

                      },
                      child: Text(
                        "Menu",
                        style: GameLocalTextStyles.actionButtonTextStyle(widget.winnerColor),
                      ),
                    ),

                    TextButton(
                      onPressed: () {

                        // Pop the dialog
                        Navigator.of(context).pop();

                        // Reset the providers of the match
                        GameLocalFunctions.resetProviders(ref);

                      },
                      child: Text(
                        "Rematch",
                        style: GameLocalTextStyles.actionButtonTextStyle(widget.winnerColor),
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),

          Positioned(
            left: 20,
            right: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 45,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(45),
                ),
                child: Container(
                  color: widget.winnerColor,
                  width: 90,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
