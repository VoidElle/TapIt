import 'package:flutter/material.dart';

class GlobalFunctions {

  static MaterialPageRoute  generateRoutes(RouteSettings settings) {

    late Widget returnScreen;

    // Todo: Redirect to specific page
    returnScreen = const Scaffold();

    return MaterialPageRoute(builder: (_) => returnScreen);
  }

}