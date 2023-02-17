import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:school_project/common_widgets/custom_button.dart';
import 'package:school_project/screens/notification/notification_screen.dart';
import 'package:school_project/screens/profile/my_account_screen.dart';

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
      name: 'Riyansh',
      cClass: 'VIIth',
      section: 'C',
      color: AppColors.primary,
    ),
    const ChildProfile(
      imageUrl: 'assets/images/girlImage.png',
      name: 'Divyanshi',
      cClass: 'Vth',
      section: 'C',
      color: Colors.transparent,
    ),
  ];

  PreferredSizeWidget appBar() {
    return AppBar(
      title: const Text(
        'Home',
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          margin: const EdgeInsets.only(right: 17.0),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.primary,
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationScreen(
                  whereToCome: "other",
                ),
              ),
            );
          },
          child: Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 17.0),
            child: Stack(
              children: [
                const Icon(
                  Icons.notifications_none,
                  color: AppColors.primary,
                  size: 30,
                ),
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(top: 5),
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                        border: Border.all(color: Colors.white, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Center(
                        child: Text(
                          notificationCount.toString(),
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicColors.background,
      appBar: appBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 17.0,
          vertical: 17.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome Rajeev!',
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: childProfile.length,
                  itemBuilder: (context, index) {
                    return ChildProfile(
                      imageUrl: childProfile[index].imageUrl,
                      name: childProfile[index].name,
                      cClass: childProfile[index].cClass,
                      section: childProfile[index].section,
                      color: childProfile[index].color,
                    );
                  }),
            ),
            CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyAccountScreen(),
                    ),
                  );
                },
                child: const Center(
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                )),
            SizedBox(height: 40),
          ],
        ),
      ),
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
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 2.0),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: [
          Image.asset(
            imageUrl,
            width: 157.0,
            height: 157.0,
          ),
          const SizedBox(
            width: 11.0,
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
                height: 2.0,
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
    );
  }
}

/*
 Container(
          margin: const EdgeInsets.symmetric(horizontal: 17.0),
          alignment: Alignment.centerLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.primary,
                ),
              ),
              const Spacer(),
              const Text(
                'Home',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                ),
              ),
              const Spacer(),
              Container(
                child: const Icon(
                  Icons.notifications_none,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
 */
