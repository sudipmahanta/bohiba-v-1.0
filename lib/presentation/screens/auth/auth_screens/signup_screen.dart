import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/extensions/app_button/global_button/global_button.dart';
import '../../../../app/extensions/app_color/app_color.dart';
import '../../../../app/extensions/app_input_field/global_input_field/global_input_field.dart';
import '../../user_authentication/screen/user_auth_screen/user_auth_screen.dart';
import 'signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {


  bool showPassword = true;

  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  final signupKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Hello!',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    Text('Let\'s begin the journey',
                      style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 0.5,
                          color: BohibaColors.secoundaryColor
                      ),
                    ),
                  ],
                ),

                Form(
                  key: signupKey,
                  child: Column(
                    children: [
                      EmailInputField(hintText: 'Email', controller: emailController),

                      TextInputField(
                        maxLength: 10,
                        controller: mobileController,
                        hintText: "Mobile Number",
                        keyboardType: TextInputType.number,
                      ),

                      PasswordInputField(hintText: 'Password', controller: pwdController)
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02),

                PrimaryButton(
                    label: 'Sign up',
                    onPressed: () {
                      Get.to(()=> const UserAuthScreen());
                    }
                )
              ]
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Already have account ? ',
              style: TextStyle(
                //color: Color(0xFF653bbf),
                  fontSize: 12.0),
            ),

            InkWell(
                onTap: () {
                  Get.to(()=> const SigninScreen());
                },
                child: Text('Signin',
                  style: TextStyle(
                      color: BohibaColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}