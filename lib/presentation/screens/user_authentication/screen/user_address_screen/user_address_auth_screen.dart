import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/extensions/app_input_field/global_input_field/global_input_field.dart';
import '../../../../../app/extensions/app_input_field/user_auth_input_field/user_auth_input_field.dart';
import '../../../../../app/extensions/app_strings/app_strings.dart';
import '../../../../controller/user_auth_controllers/user_address_auth_controller/user_address_auth_controller.dart';

class UserAddressAuthScreen extends StatefulWidget {
  const UserAddressAuthScreen({Key? key}) : super(key: key);

  @override
  State<UserAddressAuthScreen> createState() => _UserAddressAuthScreenState();
}

class _UserAddressAuthScreenState extends State<UserAddressAuthScreen> {

  var items = [
    'Aadhaar Card',
    'Ration Card',
    'Electric Bill',
    'Income Tax Assessment Order',
  ];

  final pinCodeFieldController = Get.put(UserAddressAuthController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(UserAddressAuthString.addAuth,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              )
          ),

          UserAuthDropDown(
            hint: "Choose your address proof",
            items: items,
          ),

          UserAuthContainerImageUpload(
            label: UserAddressAuthString.addressProof,
            onTap: (){},
          ),

          TextInputField(
            hintText: UserAddressAuthString.houseNo,
          ),

          TextInputField(
            hintText: UserAddressAuthString.colonyLocality,
          ),

          TextInputField(
            hintText: UserAddressAuthString.streetAddress,
          ),

          Obx(() {
              return Column(
                children: [
                  PinCodeTextField(
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    hintText: UserAddressAuthString.pin,
                    controller: pinCodeFieldController.pinController,

                    onChanged: (v){
                      if(v.length == 6) {
                        Future.delayed(Duration.zero, (){
                          pinCodeFieldController.areaCode();
                        });
                      }
                    },
                    suffixIcon: pinCodeFieldController.loadPin.value == true ?
                    Container(
                        height: 10,
                        width: 10,
                        padding: const EdgeInsets.all(15),
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2.0,
                        )
                    ) : null,
                  ),
                  UserAuthDropDown(
                    hint: UserAddressAuthString.city,
                    items: pinCodeFieldController.cityList,
                  ),
                ],
              );
            }
          ),

          TextInputField(
            hintText: UserAddressAuthString.district,
            readOnly: true,
            controller: pinCodeFieldController.distController,
          ),

          TextInputField(
            hintText: UserAddressAuthString.state,
            readOnly: true,
            controller: pinCodeFieldController.stateController,
          ),

          TextInputField(
            hintText: UserAddressAuthString.country,
            readOnly: true,
            controller: pinCodeFieldController.countryController,
          ),
        ],
      ),
    );
  }
}
