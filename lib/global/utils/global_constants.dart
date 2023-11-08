import 'package:flutter/material.dart';

class GlobalConstants {

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static const String navigationWithContextNotMounted = "ERROR: Trying to use context whilst is not mounted! Aborting the redirection...";

}