import 'package:bohiba/app/extensions/app_color/app_color.dart';
import 'package:bohiba/presentation/screens/profile/profile_screen/profile_screen.dart';
import 'package:bohiba/presentation/screens/vehicle/vehicle_screen/vehicle_screen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  bool isSwitchedA= false;
  bool isSwitchedB= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent.withOpacity(0),
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: const Text('Dashboard',
          style: TextStyle(

              color: Colors.black
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only( left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //TODO User Dashboard
              Container(
                width: MediaQuery.of(context).size.width,
                height: 210,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF047BFC),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 25, bottom: 35),
                      child: Text('Dashboard' ,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      height: 45,
                      thickness: 0.5,
                      indent: 0,
                      endIndent: 0,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                              children: [
                                DashboardItems(
                                  onPressed: (){},
                                  icon: EvaIcons.navigation2Outline,
                                  label: "TRACK",
                                ),

                                DashboardItems(
                                  onPressed: (){
                                    Get.to(()=> const VehicleScreen());
                                  },
                                  icon: EvaIcons.plus,
                                  label: "ADD\nVEHICLE",
                                ),

                                DashboardItems(
                                  onPressed: (){},
                                  icon: EvaIcons.fileOutline,
                                  label: "PAPER",
                                ),

                                DashboardItems(
                                  onPressed: (){
                                    Get.to(()=> const ProfileScreen());
                                  },
                                  icon: EvaIcons.personOutline,
                                  label: "PROFILE",
                                ),
                              ]
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),

              //TODO Dark Mode
              ListTile(
                onTap: () {
                  setState(() {
                    isSwitchedA = !isSwitchedA;
                    debugPrint(isSwitchedA.toString());}
                  );
                },
                tileColor: Colors.white,
                leading: const Icon(EvaIcons.moonOutline),
                title: const Text('Dark Mode'),
                trailing: Switch(
                  value: isSwitchedA,
                  onChanged: (value) {
                    setState(() {
                      isSwitchedA = value;
                      debugPrint(isSwitchedA.toString());
                    }
                    );
                  },
                  activeTrackColor: const Color(0xFF047BFC),
                  activeColor: Colors.white,
                ),
              ),
              const SizedBox(height: 8,),

              // TODO Biometric Login
              ListTile(
                onTap: () {
                  setState(() {
                    isSwitchedB = !isSwitchedB;
                    debugPrint(isSwitchedA.toString());}
                  );
                },
                tileColor: Colors.white,
                leading: const Icon(Icons.fingerprint_outlined),
                title: const Text('Biometric Login'),
                trailing: Switch(
                  value: isSwitchedB,
                  onChanged: (value) {
                    setState(() {
                      isSwitchedB = value;
                      debugPrint(isSwitchedB.toString());
                    }
                    );
                  },
                  activeTrackColor: const Color(0xFF047BFC),
                  activeColor: Colors.white,
                ),
              ),
              const SizedBox(height: 8,),

              // TODO Share and Earn
              ListTile(
                onTap: () {},
                tileColor: Colors.white,
                leading: const Icon(EvaIcons.shareOutline ),
                title: const Text('Share and Earn'),
              ),
              const SizedBox(height: 8),

              ListTile(
                onTap: () { },
                tileColor: Colors.white,
                leading: const Icon(EvaIcons.questionMarkCircleOutline),
                title: const Text('Help & Support'),
              ),
              const SizedBox(height: 8,),

              ListTile(
                onTap: () { },
                tileColor: Colors.white,
                leading: const Icon(EvaIcons.awardOutline),
                title: const Text('About Us'),
              ),
              const SizedBox(height: 5,),

              ListTile(
                onTap: (){

                },
                tileColor: Colors.white,
                leading: const Icon(EvaIcons.logOutOutline),
                title: const Text('Logout',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardItems extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? icon;
  final String label;
  const DashboardItems({
    Key? key,
    this.onPressed,
    this.icon,
    this.label = "Label"
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 110,
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: onPressed,
          child: Row(
            children: [
              Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: BohibaColors.primaryColor,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon,
                    color: BohibaColors.white,
                  )
              ),
              const SizedBox(width: 10,),
              Text(label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  letterSpacing: 0.8,
                  fontSize: Theme.of(context).textTheme.bodySmall!.fontSize
                )
              )
            ],
          ),
        )
    );
  }
}
