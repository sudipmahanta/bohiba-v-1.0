import 'package:bohiba/app/extensions/app_bottom_navbar/bottom_nav_bar.dart';
import 'package:bohiba/presentation/screens/auth/auth_screens/signup_screen.dart';
import 'package:bohiba/presentation/screens/spalsh/splash_screens/spalsh_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/extensions/app_theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: BohibaTheme.lightTheme,
      home: const SignUpScreen()
    );
  }
}
