import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/global/pages/global_loading_page.dart';
import 'package:tapit/global/utils/global_constants.dart';
import 'package:tapit/global/utils/global_functions.dart';

import 'menu/pages/menu_page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: TapIt(),
    ),
  );
}

class TapIt extends StatelessWidget {

  const TapIt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    /// Set the orientation to portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    /// Set the system UI overlay
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      title: "TapIt: Challenge your friends",
      navigatorKey: GlobalConstants.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontFamily: "CircularStd",
            color: Color(0xFFFFFFFF),
            fontSize: 20,
          ),
          displayMedium: TextStyle(
            fontFamily: "CircularStd",
            color: Color(0xFF000000),
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
          displaySmall: TextStyle(
            fontFamily: "CircularStd",
            color: Color(0xFF000000),
          ),
        ),
      ),
      onGenerateRoute: GlobalFunctions.generateRoutes,
      home: FutureBuilder(
        future: GlobalConstants.globalSharedPreferencesManager.init(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {

          if (snapshot.connectionState != ConnectionState.done) {
            return const GlobalLoadingPage();
          }

          return const MenuPage();
        }
      ),
    );
  }
}
