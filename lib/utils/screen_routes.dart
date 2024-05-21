import 'package:flutter/material.dart';
import 'package:gemini_ai_app/screen/dash/view/dash_screen.dart';
import 'package:gemini_ai_app/screen/history/view/history_screen.dart';
import 'package:gemini_ai_app/screen/login/view/login_screen.dart';
import 'package:gemini_ai_app/screen/setting/view/setting_screen.dart';


import '../screen/home/view/home_screen.dart';
import '../screen/splash/view/splash_screen.dart';

Map<String,WidgetBuilder>screen_routes={
  '/':(context) => const SplashScreen(),
  'dash':(context) => const DashScreen(),
  'login':(context) => const LoginScreen(),
  'home':(context) => const HomeScreen(),
  'history':(context) => const HistoryScreen(),
  'setting':(context) => const SettingScreen(),
};