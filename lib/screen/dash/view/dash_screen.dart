import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:gemini_ai_app/screen/dash/controller/dash_controller.dart';
import 'package:gemini_ai_app/screen/history/view/history_screen.dart';
import 'package:gemini_ai_app/screen/home/view/home_screen.dart';
import 'package:gemini_ai_app/screen/setting/view/setting_screen.dart';
import 'package:get/get.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  DashController controller = Get.put(DashController());
  List screen = [
    const HomeScreen(),
    const HistoryScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screen[controller.selectedIndex.value],
        bottomNavigationBar: FlashyTabBar(
          backgroundColor: Color(0xff003959),
          selectedIndex: controller.selectedIndex.value,
          showElevation: true,
          onItemSelected: (index) => setState(
            () {
              controller.selectedIndex.value = index;
            },
          ),
          items: [
            FlashyTabBarItem(
              activeColor: Colors.white,
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.white, fontFamily: "light"),
              ),
            ),
            FlashyTabBarItem(
              activeColor: Colors.white,
              icon: const Icon(
                Icons.history,
                color: Colors.white,
              ),
              title: const Text('History',
                  style: TextStyle(color: Colors.white, fontFamily: "light")),
            ),
            FlashyTabBarItem(
              activeColor: Colors.white,
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: const Text(
                'Settings',
                style: TextStyle(color: Colors.white, fontFamily: "light"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
