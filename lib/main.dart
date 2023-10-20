import 'package:cbt_mobile_application/bindings/initial_bindings.dart';
import 'package:cbt_mobile_application/controllers/auth/auth_controller.dart';
import 'package:cbt_mobile_application/screens/home/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/my_app_life_cycle_observer.dart';
import 'controllers/theme_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initialize lifecycleObserver here
  final navigatorKey = GlobalKey<NavigatorState>();
  final lifecycleObserver = MyAppLifecycleObserver(navigatorKey);

  Get.put(AuthController());
  InitialBindings().dependencies();

  runApp(MyApp(lifecycleObserver: lifecycleObserver));
}

class MyApp extends StatelessWidget {
  final MyAppLifecycleObserver lifecycleObserver;

  const MyApp({Key? key, required this.lifecycleObserver}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Get.find<ThemeController>().lightTheme,
      navigatorKey: lifecycleObserver.navigatorKey,
      home: const Home(),
    );
  }
}
