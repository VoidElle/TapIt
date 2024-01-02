import 'package:flutter/material.dart';

import '../event_listeners/background_listener_mixin.dart';

class GlobalLoadingPage extends StatefulWidget {

  const GlobalLoadingPage({
    super.key,
  });

  @override
  State<GlobalLoadingPage> createState() => _GlobalLoadingPageState();
}

class _GlobalLoadingPageState extends State<GlobalLoadingPage> with
    WidgetsBindingObserver,
    BackgroundListenerMixin<GlobalLoadingPage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [

          Center(
            child: CircularProgressIndicator(),
          ),

        ],
      ),
    );
  }

}
