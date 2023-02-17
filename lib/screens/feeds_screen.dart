import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:school_project/common_widgets/text_widget.dart';
import 'package:school_project/modals/feed_modal.dart';
import 'package:school_project/screens/join_now/join_now_screen.dart';
import 'package:school_project/utils/app_images.dart';
import 'package:school_project/utils/app_string.dart';
import 'package:school_project/common_widgets/feed_item.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  List<FeedModal> dashBoardData = [
    FeedModal(
      'Banyan School',
      'ajaysharma@yopmail.com',
      [
        AppImages.s1,
        AppImages.s2,
        AppImages.s3,
      ],
    ),
    FeedModal(
      'Cambridge Court School',
      'ajaysharma@yopmail.com',
      [
        AppImages.s4,
        AppImages.s6,
        AppImages.s7,
      ],
    ),
    FeedModal(
      'Ajay Sharma',
      'ajaysharma@yopmail.com',
      [
        AppImages.s1,
        AppImages.s2,
        AppImages.s7,
      ],
    ),
    FeedModal(
      'Ajay Sharma',
      'ajaysharma@yopmail.com',
      [
        AppImages.s3,
        AppImages.s4,
        AppImages.s6,
      ],
    ),
    FeedModal(
      'Ajay Sharma',
      'ajaysharma@yopmail.com',
      [
        AppImages.s1,
        AppImages.s4,
        AppImages.s6,
      ],
    ),
    FeedModal(
      'Ajay Sharma',
      'ajaysharma@yopmail.com',
      [
        AppImages.s4,
        AppImages.s6,
      ],
    ),
    FeedModal(
      'Ajay Sharma',
      'ajaysharma@yopmail.com',
      [
        AppImages.s7,
        AppImages.s1,
      ],
    ),
    FeedModal(
      'Ajay Sharma',
      'ajaysharma@yopmail.com',
      [
        AppImages.s3,
        AppImages.s4,
        AppImages.s6,
      ],
    ),
    FeedModal(
      'Ajay Sharma',
      'ajaysharma@yopmail.com',
      [
        AppImages.s1,
        AppImages.s4,
        AppImages.s6,
      ],
    ),
    FeedModal(
      'Ajay Sharma',
      'ajaysharma@yopmail.com',
      [
        AppImages.s2,
        AppImages.s4,
        AppImages.s6,
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicColors.background,
      floatingActionButton: NeumorphicButton(
        style: NeumorphicStyle(color: Colors.blue),
          onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const JoinNowScreen()));
      },margin: const EdgeInsets.only(bottom: 30,right: 5),
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 25), child: const Text("Join Now",textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CommonText(
                    text: appName,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ],
              ),
            ),

            Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 20.0,bottom: 100),
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        child: FadeInAnimation(
                          child: FeedItem(
                            feedData: dashBoardData[index],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: dashBoardData.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
