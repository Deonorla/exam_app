import 'package:flutter/material.dart';

class MyAppLifecycleObserver with WidgetsBindingObserver {
  final GlobalKey<NavigatorState> navigatorKey;

  MyAppLifecycleObserver(this.navigatorKey) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      // App is minimized, navigate back to the home screen
      navigatorKey.currentState?.popUntil((route) => route.isFirst);
    }
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
  }
}
