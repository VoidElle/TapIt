import 'package:flutter/material.dart';

class NewGameOnlineLobbyPage extends StatelessWidget {

  static const route = "/new-game-online-lobby-page";

  const NewGameOnlineLobbyPage({super.key});

  @override
  Widget build(BuildContext context) {

    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double usableScreenHeight = mediaQuery.size.height - mediaQuery.padding.top;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: usableScreenHeight,
            width: double.infinity,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

              ],
            ),
          ),
        ),
      ),
    );
  }

}
