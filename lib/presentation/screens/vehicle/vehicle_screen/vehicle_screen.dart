import 'package:bohiba/app/extensions/app_appbar/vehicle_appbar/vehicle_appbar.dart';
import 'package:bohiba/app/extensions/app_modal_sheet/vehicle_modal_sheet/vehicle_modal_sheet.dart';
import 'package:flutter/material.dart';

import '../../../../app/extensions/app_button/global_button/global_button.dart';

class VehicleScreen extends StatelessWidget {
  const VehicleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const VehicleAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: List.generate(3, (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.5),
              child: Card(
                color: Colors.grey.shade50,
                elevation: 0.7,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  title: const Text('OD 14X 7224'),
                  subtitle: const Text('Driver Name'),
                  trailing: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    child: InkWell(
                        onTap: (){
                          debugPrint("Edit Vehicle");
                        },
                        borderRadius: BorderRadius.circular(20.0),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.edit,
                            size: 18,
                          ),
                        )),
                  ),

                ),
              ),
            )),
          ),
        ),
      ),
      bottomNavigationBar: Material(
        child: Container(
            height: height * 0.1,
            width: width,
            alignment: Alignment.center,
            child: PrimaryButton(
              width: width * 0.65,
              height: 47,
              onPressed: (){
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return const VehicleModalSheet();
                  },
                );
              },
              label: "Add Vehicle",
            )
        ),
      ),
    );
  }
}
