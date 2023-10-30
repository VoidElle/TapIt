import 'package:flutter/material.dart';
import 'package:tapit/game/local/utils/game_local_text_styles.dart';
import 'package:tapit/menu/pages/menu_page.dart';

import '../utils/game_local_enums.dart';

class GameLocalWinDialog extends StatelessWidget {

  final GameLocalPlayerEnum gameLocalPlayerEnum;
  final Color winnerColor;

  const GameLocalWinDialog({
    super.key,
    required this.gameLocalPlayerEnum,
    required this.winnerColor,
  });

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
                  "${gameLocalPlayerEnum.text} player won the game",
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

                        // Redirect to the Menu page
                        Navigator.of(context).pushReplacementNamed(MenuPage.route);

                      },
                      child: Text(
                        "Menu",
                        style: GameLocalTextStyles.actionButtonTextStyle(winnerColor),
                      ),
                    ),

                    TextButton(
                      onPressed: () {

                        // Pop the dialog
                        Navigator.of(context).pop();

                      },
                      child: Text(
                        "Rematch",
                        style: GameLocalTextStyles.actionButtonTextStyle(winnerColor),
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
                  color: winnerColor,
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
