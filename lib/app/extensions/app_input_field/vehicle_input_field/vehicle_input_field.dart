import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../app_icons/bohiba_icon.dart';

class ChooseVehicleWheel extends StatefulWidget {
  const ChooseVehicleWheel({Key? key}) : super(key: key);

  @override
  State<ChooseVehicleWheel> createState() => _ChooseVehicleWheelState();
}

class _ChooseVehicleWheelState extends State<ChooseVehicleWheel> {
  String? wheel = "6";

  // List of items in our dropdown menu
  var items = [
    '6',
    '12',
    '14',
    '16',
    '22',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.30,
      height: 47,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
              width: 1.2,
              color: Colors.grey.shade400
          )
      ),
      child: Row(

        children: [
          ImageIcon(
            AssetImage(BohibaIcons.doubleTire),
            size: 24,
          ),
          const VerticalDivider(
            thickness: 1.2,
            endIndent: 5,
            indent: 5,
          ),
          const Spacer(),
          DropdownButtonHideUnderline(
            child: DropdownButton(
              value: wheel,
              borderRadius: BorderRadius.circular(10.0),
              icon: Icon(Remix.arrow_down_s_line,
                color: Colors.grey.shade400,
              ),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  wheel = newValue!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}