import 'package:bohiba/app/extensions/app_color/app_color.dart';
import 'package:bohiba/app/extensions/app_strings/app_strings.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          // centerTitle: false,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: BohibaColors.primaryColor,
              ),
              const Spacer(),
              Text(GlobalStrings.bohiba,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.displaySmall!.fontSize,
                  fontWeight: Theme.of(context).textTheme.headlineMedium!.fontWeight,
                  color: BohibaColors.primaryColor
                ),
              ),
              const Spacer(),
            ],
          ),
          actions: [

            IconButton(
                tooltip: 'Add Vehicle',
                onPressed: (){
                  // Get.to(()=> const AddVehiclePage());
                },
                icon: const Icon(Remix.message_3_fill,)
            ),
          ],
        )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
