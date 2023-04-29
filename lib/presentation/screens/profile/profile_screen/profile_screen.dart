import 'package:bohiba/app/extensions/app_color/app_color.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;
import 'package:remixicon/remixicon.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    debugPrint("Modal Sheet");
                  },
                  child: badge.Badge(
                    elevation: 0.5,
                    padding: EdgeInsets.zero,
                    badgeColor: BohibaColors.white,
                    badgeContent: const Icon(EvaIcons.plusCircle),
                    position: const badge.BadgePosition(
                      bottom: 5,
                      end: 5
                    ),
                    child: const CircleAvatar(
                      radius: 45,
                    ),
                  ),
                ),

                IconButton(
                  onPressed: (){

                    },
                  icon: const Icon(Remix.pencil_fill),
                  iconSize: 22,
                )
              ],
            ),

            Text("M. Ramnarayan",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize,
                color: BohibaColors.black
              )
            ),
            /*Text("@m.narayan71",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                color: BohibaColors.secoundaryColor
              )
            ),*/
            Chip(
              labelPadding: const EdgeInsets.symmetric(horizontal: 15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
              ),
              label: const Text('Iron'),
              labelStyle: TextStyle(
                fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                color: BohibaColors.black
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text("Bonaigarh, Odisha, IN",
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                      fontWeight: Theme.of(context).textTheme.bodyMedium!.fontWeight,
                      color: BohibaColors.secoundaryColor
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
