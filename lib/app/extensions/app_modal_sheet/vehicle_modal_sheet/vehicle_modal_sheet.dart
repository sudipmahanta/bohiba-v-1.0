import 'package:flutter/material.dart';

import '../../app_button/global_button/global_button.dart';
import '../../app_input_field/global_input_field/global_input_field.dart';
import '../../app_input_field/vehicle_input_field/vehicle_input_field.dart';
import '../../app_strings/app_strings.dart';

class VehicleModalSheet extends StatefulWidget {
  const VehicleModalSheet({Key? key}) : super(key: key);

  @override
  State<VehicleModalSheet> createState() => _VehicleModalSheetState();
}

class _VehicleModalSheetState extends State<VehicleModalSheet> {

  // Variable
  bool agree = false;
  TextInputType regdNoInputType = TextInputType.text;
  TextInputType chassisNoInputType = TextInputType.text;

  // Controller
  final regdNoController = TextEditingController();
  final engineController = TextEditingController();
  final chassisController = TextEditingController();
  final ownerNameController = TextEditingController();
  final driverNameController = TextEditingController();
  final driverLicenseController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding:
        EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4.0,
              width: width * 0.10,
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10.0)
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Text('Vehicle Registration',
                style: TextStyle(
                    fontSize: 16
                ),
              ),
            ),
            SizedBox(height: height * 0.02),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextInputField(
                        maxLength: 10,
                        hintText: VehicleDashString.vehicleNo,
                        keyboardType: regdNoInputType,
                        textCapitalization: TextCapitalization.characters,
                        controller: regdNoController,
                        onChanged: (v){
                          if(v.length == 2 && regdNoInputType == TextInputType.text) {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              regdNoInputType = TextInputType.number;
                            });
                            Future.delayed(const Duration(milliseconds: 150),(){
                              FocusScope.of(context).requestFocus();
                            });
                          } else if(v.length == 4 && regdNoInputType == TextInputType.number) {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              regdNoInputType = TextInputType.text;
                            });
                            Future.delayed(const Duration(milliseconds: 150),(){
                              FocusScope.of(context).requestFocus();
                            });
                          }else if(v.isEmpty && regdNoInputType == TextInputType.number) {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              regdNoInputType = TextInputType.text;
                            });
                            Future.delayed(const Duration(milliseconds: 150),(){
                              FocusScope.of(context).requestFocus();
                            });
                          }
                        },
                      ),

                      TextInputField(
                        maxLength: 9,
                        hintText: VehicleDashString.engineNo,
                        controller: engineController,
                        textCapitalization: TextCapitalization.characters,
                      ),

                      TextInputField(
                        maxLength: 17,
                        keyboardType: chassisNoInputType,
                        hintText: VehicleDashString.chassisNo,
                        textCapitalization: TextCapitalization.characters,
                        onChanged: (v){
                          debugPrint(v.length.toString());
                          if(v.length >= 11 && chassisNoInputType == TextInputType.text){
                            FocusScope.of(context).unfocus();
                            setState(() {
                              chassisNoInputType = TextInputType.number;
                            });
                            Future.delayed(const Duration(milliseconds: 150), (){
                              FocusScope.of(context).requestFocus();
                            });
                          }else if(v.length <=10 && chassisNoInputType == TextInputType.number){
                            FocusScope.of(context).unfocus();
                            setState(() {
                              chassisNoInputType = TextInputType.text;
                            });
                            Future.delayed(const Duration(milliseconds: 150), (){
                              FocusScope.of(context).requestFocus();
                            });
                          } else if(v.isEmpty) {
                            FocusScope.of(context).unfocus();
                            setState(() {
                              chassisNoInputType = TextInputType.text;
                            });
                            Future.delayed(const Duration(milliseconds: 150), (){
                              FocusScope.of(context).requestFocus();
                            });
                          }else{}
                        },
                      ),

                      TextInputField(
                          hintText: VehicleDashString.ownerName,
                          controller: ownerNameController
                      ),

                      Row(
                        children: const [
                          ChooseVehicleWheel(),
                          Spacer(),
                        ],
                      ),
                      const SizedBox(height: 5),

                      CheckboxListTile(
                        value: agree,
                        onChanged: (value){
                          setState(() {
                            agree =! agree;
                          });},
                        title: const Text('I agree that above details are ture to my knowledge.',
                            style: TextStyle(
                                fontSize: 11
                            )
                        ),
                      ),

                      PrimaryButton(label: 'VERIFY', onPressed: () {},)
                    ],
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
