import 'package:bohiba/presentation/screens/auth/auth_screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/extensions/app_bottom_navbar/bottom_nav_bar.dart';
import '../../../../app/extensions/app_button/global_button/global_button.dart';
import '../../../../app/extensions/app_color/app_color.dart';
import '../../../../app/extensions/app_input_field/global_input_field/global_input_field.dart';


class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {

  //TextField State
  bool showPassword = true;

  //Email and Password Controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: height,
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text('Welcome',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Text('Login to get Started',
                        style: TextStyle(
                            fontSize: 12,
                            letterSpacing: 0.5,
                            color: BohibaColors.secoundaryColor
                        ),
                      ),
                    ],
                  ),

                  // Login Form
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        EmailInputField(hintText: 'Email', controller: emailController),
                        PasswordInputField(hintText: 'Password', controller: pwdController)
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  //Recover Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: (){},
                      child: Text('Recover Password',
                        style: TextStyle(
                            color: BohibaColors.primaryColor,
                            decoration: TextDecoration.underline,
                            fontSize: 12.0
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  PrimaryButton(
                    label: 'Sign in',
                    onPressed: (){
                      Get.to(()=> BohibaNavBar(currentIndex: 0,));
                    },
                  ),
                ]
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have account ? ',
                style: TextStyle(
                  //color: Color(0xFF653bbf),
                    fontSize: 12.0),
              ),
              InkWell(
                  onTap: () {
                    Get.to(()=>  const SignUpScreen());
                  },
                  child: Text('Sign Up',
                    style: TextStyle(
                        color: BohibaColors.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
