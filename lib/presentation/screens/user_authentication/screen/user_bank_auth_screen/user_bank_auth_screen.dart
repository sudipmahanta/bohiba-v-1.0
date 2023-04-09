import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/extensions/app_bottom_navbar/bottom_nav_bar.dart';
import '../../../../../app/extensions/app_button/global_button/global_button.dart';
import '../../../../../app/extensions/app_input_field/global_input_field/global_input_field.dart';
import '../../../../../app/extensions/app_input_field/user_auth_input_field/user_auth_input_field.dart';
import '../../../../../app/extensions/app_strings/app_strings.dart';

class UserBankAuthScreen extends StatefulWidget {
  const UserBankAuthScreen({Key? key}) : super(key: key);

  @override
  State<UserBankAuthScreen> createState() => _UserBankAuthScreenState();
}

class _UserBankAuthScreenState extends State<UserBankAuthScreen> {

  List<String> items = [
    "SBI",
    "PNB",
    "HDFC",
    "ICICI",
    "Axis Bank of India",
    "Kotak Mahindra",
  ];

  TextInputType keyboardType = TextInputType.text;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(UserBankAuthString.bankAuth,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              )
          ),

          UserAuthDropDown(
            hint: "Choose your bank",
            items: items,
          ),

          TextInputField(
            hintText: UserBankAuthString.acNo,
            keyboardType: TextInputType.number,
          ),

          TextInputField(
            maxLength: 11,
            keyboardType: keyboardType,
            textCapitalization: TextCapitalization.characters,
            hintText: UserBankAuthString.ifsc,
            onChanged: (value) {
              if(value.length == 4 && keyboardType == TextInputType.text) {
                FocusScope.of(context).unfocus();
                setState((){
                  keyboardType = TextInputType.number;
                });
                Future.delayed(const Duration(milliseconds: 150)).then((value) {
                  FocusScope.of(context).requestFocus();
                });
              } else if (value.isEmpty){
                FocusScope.of(context).unfocus();
                setState((){
                  keyboardType = TextInputType.text;
                });
                Future.delayed(const Duration(milliseconds: 150)).then((value) {
                  FocusScope.of(context).requestFocus();
                });
              }else{}
            },
          ),

          UserAuthContainerImageUpload(
            onTap: (){},
            label: "Upload your Passbook Image",
          ),

          PrimaryButton(
              onPressed: (){
                Get.to(()=> BohibaNavBar(currentIndex: 0,));
              },
              label: "SUBMIT"
          )

        ],
      ),
    );
  }
}