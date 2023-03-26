import 'package:bohiba/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/extensions/app_color/app_color.dart';
import '../../../../app/extensions/app_strings/app_strings.dart';
import '../../auth/auth_screens/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), (){
      Get.to(()=> const SignUpScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
          child: Container(
            height: height,
            width: width,
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 80,
              backgroundColor: BohibaColors.primaryColor,
              child: Text(GlobalStrings.bohiba,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.displayLarge!.fontSize,
                  color: BohibaColors.white
                )
              ),
            ),
          )
      ),
    );
  }
}
