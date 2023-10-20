import 'package:flutter/material.dart';

class MyAppLifecycleObserver with WidgetsBindingObserver {
  final GlobalKey<NavigatorState> navigatorKey;
  bool appInBackground = false; // Add this flag

  MyAppLifecycleObserver(this.navigatorKey) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      // App is minimized
      appInBackground = true;
      print('App is minimized'); // Debug statement
    }
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }
}
