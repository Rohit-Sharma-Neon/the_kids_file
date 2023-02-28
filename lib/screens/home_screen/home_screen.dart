import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:school_project/common_widgets/animated_list_view_builder.dart';
import 'package:school_project/common_widgets/base_app_bar.dart';
import 'package:school_project/screens/my_account/my_account_screen.dart';
import 'package:school_project/screens/notification/notification_screen.dart';
import 'package:school_project/utils/sizes.dart';

import '../../utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int notificationCount = 2;
  bool isSelected = false;
  List<ChildProfile> childProfile = [
    const ChildProfile(
      imageUrl: 'assets/images/boyImage.png',
      name: 'Rohit',
      cClass: 'VIIth',
      section: 'C',
      color: AppColors.primaryColor,
    ),
    const ChildProfile(
      imageUrl: 'assets/images/girlImage.png',
      name: 'Divyanshi',
      cClass: 'Vth',
      section: 'C',
      color: Colors.transparent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: BaseAppBar(
        title: "Home",
        leading: const SizedBox.shrink(),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              SizedBox(
                height: double.infinity,
                child: NeumorphicButton(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    style: const NeumorphicStyle(depth: 8,color: AppColors.primaryColor),
                    child: const Icon(
                      Icons.notifications_none,
                      color: Colors.black,
                      size: 30,
                    ),onPressed: (){PersistentNavBarNavigator.pushNewScreen(context, screen: const NotificationScreen(
                  whereToCome: "other",
                ),);}),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8,top: 4),
                child: Text(
                  notificationCount.toString(),
                  style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: childProfile.length,
          padding: const EdgeInsets.only(top: 20,right: scaffoldHorizontalPadding,left: scaffoldHorizontalPadding),
          itemBuilder: (context, index) {
            return AnimatedListViewBuilder(
              index: index,
              child: ChildProfile(
                imageUrl: childProfile[index].imageUrl,
                name: childProfile[index].name,
                cClass: childProfile[index].cClass,
                section: childProfile[index].section,
                color: childProfile[index].color,
              ),
            );
          }),
    );
  }
}

class ChildProfile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String cClass;
  final String section;
  final Color color;

  const ChildProfile({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.cClass,
    required this.section,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        PersistentNavBarNavigator.pushNewScreen(context, screen: const MyAccountScreen());
      },
      child: Neumorphic(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Row(
          children: [
            Image.asset(
              imageUrl,
              width: 100,
              height: 100,
            ),
            const SizedBox(
              width: 11,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '$cClass - $section',
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}