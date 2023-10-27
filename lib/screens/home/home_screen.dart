import 'package:cbt_mobile_application/constants/colors.dart';
import 'package:cbt_mobile_application/constants/ui_constant.dart';

import 'package:cbt_mobile_application/screens/profile/profile.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<Widget> pages = const [Home(), Profile()];

  @override
  Widget build(BuildContext context) {
    final appbar = UiConstant.appBar();

    return Scaffold(
        appBar: _currentIndex == 0 ? appbar : null,
        backgroundColor: primaryColor,
        body: pages[_currentIndex],
        bottomNavigationBar: NavigationBarTheme(
          data: const NavigationBarThemeData(
              // indicatorColor: onboardingColorPage3,
              elevation: 10),
          child: NavigationBar(
              selectedIndex: _currentIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              destinations: const [
                NavigationDestination(
                    selectedIcon: Icon(
                      CupertinoIcons.house_fill,
                      color: Colors.black,
                    ),
                    icon: Icon(CupertinoIcons.home),
                    label: ""),
                NavigationDestination(
                    selectedIcon: Icon(
                      CupertinoIcons.person_alt,
                      color: Colors.black,
                    ),
                    icon: Icon(CupertinoIcons.person),
                    label: ""),
              ]),
        ));
  }
}
