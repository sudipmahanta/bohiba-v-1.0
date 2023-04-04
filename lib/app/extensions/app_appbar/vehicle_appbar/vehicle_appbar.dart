import 'package:flutter/material.dart';

class VehicleAppBar extends StatelessWidget implements PreferredSizeWidget{
  const VehicleAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          title: const Text("Your Vehicle",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        )
    );
  }
}
