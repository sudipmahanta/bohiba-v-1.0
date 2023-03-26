import 'package:bohiba/app/extensions/app_color/app_color.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class NetworkScreen extends StatefulWidget {
  const NetworkScreen({Key? key}) : super(key: key);

  @override
  State<NetworkScreen> createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Column(
          children: [
            ListTile(
              onTap: (){},
              shape: const RoundedRectangleBorder(),
              tileColor: BohibaColors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              leading: Text('Manage my network',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              trailing: const Icon(EvaIcons.arrowForwardOutline),
            ),

          ],
        ),
      ),
    );
  }
}
