import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../app/extensions/app_input_field/user_auth_input_field/user_auth_input_field.dart';
import '../../../../../app/extensions/app_input_field/user_auth_input_field/user_auth_input_field_formatter.dart';

class UserDocAuthScreen extends StatefulWidget {
  const UserDocAuthScreen({Key? key}) : super(key: key);

  @override
  State<UserDocAuthScreen> createState() => _UserDocAuthScreenState();
}

class _UserDocAuthScreenState extends State<UserDocAuthScreen> {

  TextInputType keyboardType = TextInputType.text;

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text("Document Authentication",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                )
            ),

            TextImageInputField(
              maxLength: 19,
              hintText: "Aadhaar Number",
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                AadhaarInputFormatter()
              ],
              suffixIcon: UserAuthImageUpload(
                onTap: (){},
                tooltip: "Aadhaar Image",
              ),
            ),

            TextImageInputField(
              maxLength: 10,
              hintText: "Pan Number",
              keyboardType: keyboardType,
              textCapitalization: TextCapitalization.characters,
              onChanged: (value) {
                if(value.length == 5 && keyboardType == TextInputType.text) {
                  FocusScope.of(context).unfocus();
                  setState(() {
                    keyboardType = TextInputType.number;
                  });
                  Future.delayed(const Duration(milliseconds: 150)).then((value) {
                    FocusScope.of(context).requestFocus();
                  });
                } else if(value.length == 9 && keyboardType == TextInputType.number) {
                  FocusScope.of(context).unfocus();
                  setState(() {
                    keyboardType = TextInputType.text;
                  });
                  Future.delayed(const Duration(milliseconds: 150)).then((value) {
                    FocusScope.of(context).requestFocus();
                  });
                } else if (value.isEmpty){
                  FocusScope.of(context).unfocus();
                  setState(() {
                    keyboardType = TextInputType.text;
                  });
                  Future.delayed(const Duration(milliseconds: 150)).then((value) {
                    FocusScope.of(context).requestFocus();
                  });
                }
              },
              suffixIcon: const UserAuthImageUpload(
                tooltip: "PAN Image",
              ),
            ),
            SizedBox(height: height * 0.006),

            const UserAuthContainerImageUpload(
              label: "Upload your Signature",
            ),
          ],
        ),
      ),
    );
  }
}
