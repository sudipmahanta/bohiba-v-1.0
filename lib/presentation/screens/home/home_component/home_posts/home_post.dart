import 'package:bohiba/app/extensions/app_icons/bohiba_icon.dart';
import 'package:bohiba/presentation/screens/home/home_component/home_post_comment/home_post_comment.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../app/extensions/app_color/app_color.dart';
import '../../../../../app/extensions/app_page_transition/app_page_transition.dart';

class HomePost extends StatelessWidget {
  const HomePost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return  Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      margin: const EdgeInsets.only(bottom: 25.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 0.5,
            color: Colors.grey.shade300
          ),
          borderRadius: BorderRadius.circular(15.0)
      ),
      child: Column(
        children: [
          /*const PostUserDetails(
            profileImage: NetworkImage('https://images.unsplash.com/photo-1678361912768-454545823d31?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'),
            userName: "M. RamNarayan",
            userID: "m.narayan71",
          ),*/

          const PostDescTag(
            postDescription: "Looking for load near you here we come with solution for all tipper owner get rid of 10apps in your mobile and get solution from\none place",
            tags: "#iron #mines #rm",
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CompanyDetails(),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  WheelMetalContainer(
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          ImageIcon(AssetImage(BohibaIcons.iron)),

                          VerticalDivider(
                            thickness: 1.5,
                            color: BohibaColors.white,
                          ),

                          Text("Iron",
                            style: Theme.of(context).textTheme.labelMedium,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),

                  WheelMetalContainer(
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          ImageIcon(AssetImage(BohibaIcons.doubleTire)),

                          VerticalDivider(
                            thickness: 1.5,
                            color: BohibaColors.white,
                          ),

                          SizedBox(
                            height: 20,
                            width: 95,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Text('12',
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                PostsButtons(
                  onTap: (){
                    Navigator.of(context).push(slideUpRoute(const HomePostComment()));
                  },
                  iconData: Remix.chat_3_fill,
                  counts: "2.5k",
                ),
                PostsButtons(
                  onTap: () async{
                    await Share.share("Hello this post is form Bohiba");
                  },
                  iconData: Remix.share_forward_fill,
                  counts: "2.5k",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  
}

class PostUserDetails extends StatefulWidget {
  final ImageProvider<Object>? profileImage;
  final String userName;
  final String userID;
  final String postedTime;
  const PostUserDetails({
    Key? key, 
    this.profileImage,
    this.userName = "Mangal Kishore Mahanta",
    this.userID = "mangalkishore",
    this.postedTime = "2w",
  }) : super(key: key);

  @override
  State<PostUserDetails> createState() => _PostUserDetailsState();
}

class _PostUserDetailsState extends State<PostUserDetails> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: BohibaColors.primaryVariantColor,
            backgroundImage: widget.profileImage,
          ),
          const SizedBox(width: 5),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.userName,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                  fontWeight: Theme.of(context).textTheme.headlineMedium!.fontWeight
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("@${widget.userID}",
                    style: TextStyle(
                        fontSize: Theme.of(context).textTheme.labelSmall!.fontSize,
                        color: Colors.grey,
                        fontWeight: Theme.of(context).textTheme.titleSmall!.fontWeight
                    )
                  ),
                  const SizedBox(width: 10.0),
                  const Icon(EvaIcons.globe2,
                    size: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Text(widget.postedTime,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: Theme.of(context).textTheme.titleSmall!.fontWeight
                        )
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class PostDescTag extends StatelessWidget {
  final String postDescription;
  final String tags;
  const PostDescTag({
    Key? key,
    this.postDescription = "Desc is Empty",
    this.tags = "#bohiba"
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: Wrap(
        runSpacing: 5.0,
        children: [
          Text(postDescription,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: BohibaColors.black,
                  fontSize: Theme.of(context).textTheme.labelSmall!.fontSize,
                  fontWeight: Theme.of(context).textTheme.titleSmall!.fontWeight
              )
          ),
          Text(tags,
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
            ),
          ),
        ],
      ),
    );
  }
}

class CompanyDetails extends StatelessWidget {
  const CompanyDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 8.0, bottom: 10),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Shiv Metallics SM',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Text('Sundergarh',
            style: TextStyle(
              fontSize:  Theme.of(context).textTheme.labelSmall!.fontSize,
              fontWeight: FontWeight.w700,
              color: BohibaColors.orange
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            width: 2.5,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10.0)
            ),
          ),
          Text('Ramco Metallics RM',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Text('Cuttack',
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.labelSmall!.fontSize,
                fontWeight: FontWeight.w700,
                color: BohibaColors.orange
            ),
          ),
        ],
      ),
    );
  }
}

class WheelMetalContainer extends StatelessWidget {
  final Widget? child;
  const WheelMetalContainer({
    Key? key,
    this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: 40,
      width: width/2.35,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: const BorderRadius.horizontal(left: Radius.circular(10))
      ),
      child: child,
    );
  }
}

class PostsButtons extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData? iconData;
  final String counts;
  const PostsButtons({
    Key? key,
    this.onTap,
    this.iconData,
    this.counts = "0",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.grey.shade50,
      elevation: 0.5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          width: width * 0.43,
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0)
          ),
          child: Wrap(
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              InkWell(
                  child: Icon(iconData,
                    size: 20,
                  )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(counts,
                  style: TextStyle(
                      letterSpacing: 1.2,
                      fontSize: Theme.of(context).textTheme.titleSmall!.fontSize,
                      color: BohibaColors.secoundaryColor
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
