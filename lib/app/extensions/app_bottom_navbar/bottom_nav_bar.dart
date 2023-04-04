import 'package:bohiba/presentation/screens/home/home_screens/home_screen.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../../../presentation/screens/dashboard/dashboard_screen/dashboard_screen.dart';
import '../../../presentation/screens/notification/notification_screen/notification_screen.dart';
import '../app_color/app_color.dart';

class BohibaNavBar extends StatefulWidget {
  int currentIndex;
  BohibaNavBar({Key? key, this.currentIndex = 0}) : super(key: key);

  @override
  State<BohibaNavBar> createState() => _BohibaNavBarState();
}

class _BohibaNavBarState extends State<BohibaNavBar> {

  get items =>  const [
    BottomNavigationBarItem(
        icon: Icon(Remix.home_line),
        activeIcon: Icon(Remix.home_fill),
        label: "Home",
        tooltip: "Home"
    ),
   /* BottomNavigationBarItem(
        icon: Icon(Remix.parent_line),
        activeIcon: Icon(Remix.parent_fill),
        label: "Network",
        tooltip: "Network"
    ),*/
    BottomNavigationBarItem(
        icon: Icon(Remix.notification_line),
        activeIcon: Icon(Remix.notification_fill),
        label: "Notification",
        tooltip: "Notification"
    ),
    BottomNavigationBarItem(
      icon: Icon(Remix.dashboard_fill),
      activeIcon: Icon(Remix.function_fill),
      label: "Dashboard",
      tooltip: "Dashboard",
    )
  ];

  final List _screens = const [
    HomeScreen(),
   /* NetworkScreen(),*/
    NotificationScreen(),
    DashboardScreen(),
  ];

  void _onTap(int index){
    setState(() {
      widget.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: _screens.elementAt(widget.currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        elevation: 10,
        currentIndex: widget.currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500
        ),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: BohibaColors.secoundaryColor,
        onTap: _onTap,
      ),
    );
  }
}
