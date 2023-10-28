import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tapit/menu/pages/menu_page.dart';

import '../../../global/utils/global_color_constants.dart';
import '../utils/game_local_enums.dart';
import '../utils/game_local_functions.dart';

class GameLocalWinDialog extends ConsumerWidget {

  final GameLocalPlayerEnum gameLocalPlayerEnum;
  final Color winnerColor;

  const GameLocalWinDialog({
    Key? key,
    required this.gameLocalPlayerEnum,
    required this.winnerColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  style: GoogleFonts.odibeeSans(
                    textStyle: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: GlobalColorConstants.kBlackColor,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                Text(
                  "${gameLocalPlayerEnum.text} player won the game",
                  style: GoogleFonts.rubik(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: GlobalColorConstants.kBlackColor,
                    ),
                  ),
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
                        Navigator.of(context).pushNamed(MenuPage.route);

                        // Reset the providers of the game
                        GameLocalFunctions.resetProviders(ref);

                      },
                      child: Text(
                        "Menu",
                        style: TextStyle(
                          fontSize: 18,
                          color: winnerColor,
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: () {

                        // Reset the providers of the game
                        GameLocalFunctions.resetProviders(ref);

                        // Pop the dialog
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Rematch",
                        style: TextStyle(
                          fontSize: 18,
                          color: winnerColor,
                        ),
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
