import 'package:bohiba/app/extensions/app_appbar/home_appbar/home_appbar.dart';
import 'package:bohiba/app/extensions/app_color/app_color.dart';
import 'package:bohiba/presentation/screens/home/home_component/home_posts/home_post.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(

      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          child: Column(
            children: List.generate(10, (index) =>
               HomePost()
            ),
          ),
        ),
      ),
    );
  }
}
