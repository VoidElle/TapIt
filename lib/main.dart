import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapit/global/pages/global_loading_page.dart';
import 'package:tapit/global/utils/global_constants.dart';
import 'package:tapit/global/utils/global_functions.dart';

import 'menu/pages/menu_page.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: GlobalConstants.supportedLocales,
      path: GlobalConstants.translationsPath,
      fallbackLocale: GlobalConstants.fallbackLocale,
      child: const ProviderScope(
        child: TapIt(),
      ),
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
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: "TapIt: Challenge your friends",
      navigatorKey: GlobalConstants.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: GlobalConstants.globalTheme,
      onGenerateRoute: GlobalFunctions.generateRoutes,
      home: FutureBuilder(
        future: GlobalConstants.globalSharedPreferencesManager.init(),
        builder: (BuildContext _, AsyncSnapshot<void> snapshot) {

          if (snapshot.connectionState != ConnectionState.done) {
            return const GlobalLoadingPage();
          }

          return const MenuPage();
        }
      ),
    );
  }
}
