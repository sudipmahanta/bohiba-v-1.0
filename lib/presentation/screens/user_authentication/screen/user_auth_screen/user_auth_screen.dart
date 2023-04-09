import 'package:flutter/material.dart';

import '../../../../../app/extensions/app_color/app_color.dart';
import '../user_address_screen/user_address_auth_screen.dart';
import '../user_bank_auth_screen/user_bank_auth_screen.dart';
import '../user_doc_auth_screen/user_doc_auth_screen.dart';


class UserAuthScreen extends StatefulWidget {
  const UserAuthScreen({Key? key}) : super(key: key);

  @override
  State<UserAuthScreen> createState() => _UserAuthScreenState();
}

class _UserAuthScreenState extends State<UserAuthScreen> {

  int _currentStep = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Theme(
          data: ThemeData(
              colorScheme: Theme.of(context).colorScheme.copyWith(primary: BohibaColors.successColor),
              primaryColor: BohibaColors.successColor,
              canvasColor: BohibaColors.white,
              inputDecorationTheme: Theme.of(context).inputDecorationTheme
          ),
          child: Stepper(
              type: StepperType.horizontal,
              elevation: 0,
              steps: [
                Step(
                    isActive: _currentStep == 0 ? true : false,
                    state: _currentStep >= 0 ?
                    StepState.indexed : StepState.disabled,
                    title: const Text('Document'),
                    content: const UserDocAuthScreen()
                ),
                Step(
                    isActive: _currentStep == 1 ? true : false,
                    state: _currentStep >= 0 ?
                    StepState.indexed : StepState.disabled,
                    title: const Text('Address'),
                    content: const UserAddressAuthScreen()
                ),
                Step(
                    isActive: _currentStep == 2 ? true : false,
                    state: _currentStep >= 0 ?
                    StepState.indexed : StepState.disabled,
                    title: const Text('Bank'),
                    content: const UserBankAuthScreen()
                ),
              ],
              onStepContinue: (){
                _currentStep < 2 ?
                setState(() => _currentStep += 1): null;
              },
              onStepTapped: (int index){
                setState(() => _currentStep = index);
              },
              currentStep: _currentStep,
              controlsBuilder: (context, details) {
                return Row(
                  children: [
                    Container(),
                    Container(),
                  ],
                );
              }
          ),
        ),
      ),
    );
  }
}
