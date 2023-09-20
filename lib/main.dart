import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/global/utils/global_functions.dart';
import 'package:tapit/menu/pages/menu_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: TapIt(),
    ),
  );
}

class TapIt extends StatelessWidget {

  const TapIt({super.key});

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
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) => GlobalFunctions.generateRoutes(settings),
      home: const MenuPage(),
    );
  }

}
