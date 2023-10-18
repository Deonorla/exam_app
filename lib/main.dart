import 'package:cbt_mobile_application/bindings/initial_bindings.dart';
import 'package:cbt_mobile_application/controllers/auth/auth_controller.dart';
import 'package:cbt_mobile_application/screens/home/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart'; // Import widgets.dart for WidgetsBindingObserver
import 'package:get/get.dart';

import 'controllers/my_app_life_cycle_observer.dart';
import 'controllers/theme_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(AuthController());
  InitialBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigatorKey = GlobalKey<NavigatorState>();
    final lifecycleObserver = MyAppLifecycleObserver(navigatorKey);

    // Add the WidgetsBindingObserver to the root widget
    WidgetsBinding.instance.addObserver(lifecycleObserver);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Get.find<ThemeController>().lightTheme,
      navigatorKey: navigatorKey,
      home: const Home(),
    );
  }
}
