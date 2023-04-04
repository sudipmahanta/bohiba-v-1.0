import 'package:bohiba/app/extensions/app_appbar/home_appbar/home_appbar.dart';
import 'package:bohiba/app/extensions/app_color/app_color.dart';
import 'package:bohiba/presentation/screens/home/home_component/home_posts/home_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../profile/profile_screen/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const Padding(
                padding: EdgeInsets.only(left: 8.0, top: 8.0),
                child: CircleAvatar(
                  radius: 45,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                child: Text("M.Ramnarayan",
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headlineMedium!.fontSize
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("@m.narayan71",
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
                    color: BohibaColors.secoundaryColor
                  ),
                ),
              ),

              GestureDetector(
                onTap: (){
                  Get.to(() => const ProfileScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('View profile',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
              const Divider(),

            ],
          ),
        ),
      ),
      appBar: HomeAppBar(
        openDrawer: (){
          _scaffoldKey.currentState!.openDrawer();
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          child: Column(
            children: List.generate(10, (index) =>
               const HomePost()
            ),
          ),
        ),
      ),
    );
  }
}
