import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';

import '../home_posts/home_post.dart';

class HomePostComment extends StatelessWidget {
  const HomePostComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Comment'),
        actions: [
          IconButton(
              tooltip: 'Add Vehicle',
              onPressed: (){
                // Get.to(()=> const AddVehiclePage());
              },
              icon: const Icon(Remix.message_3_fill,)
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: const [
              PostUserDetails(),
              PostDescTag(
                postDescription: "Looking for load near you here we come with solution for all tipper owner get rid of 10apps in your mobile and get solution from\none place",
                tags: "#bohiba #load",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
