import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:school_project/common_widgets/base_app_bar.dart';
import 'package:school_project/screens/books%20order/books_order_screen.dart';
import 'package:school_project/screens/gallery/gallery_screen.dart';
import 'package:school_project/screens/my_account/payment_summary_screen.dart';
import 'package:school_project/screens/no_route.dart';
import 'package:school_project/screens/trackChild/track_child_screen.dart';
import 'package:school_project/screens/uniform%20order/uniform_order_screen.dart';
import 'package:school_project/utils/app_colors.dart';
import 'package:school_project/utils/sizes.dart';
import '../notification/notification_screen.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  int notificationCount = 2;

  PreferredSizeWidget appBar() {
    return BaseAppBar(
      title: "My Account",
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
    );
  }

  final List<BuildGridHelper> buildGridHelper = [
    const BuildGridHelper(
      title: 'Fees',
      imageUrl: 'assets/icons/fees.png',
      routeToPush: PaymentSummaryScreen(),
    ),
    const BuildGridHelper(
      title: 'Notification',
      imageUrl: 'assets/icons/notificationIcon.png',
      routeToPush: NotificationScreen(
        whereToCome: "other",
      ),
    ),
    const BuildGridHelper(
      title: 'Attendance',
      imageUrl: 'assets/icons/calendar.png',
      routeToPush: NoRoute(title: 'Attendance'),
    ),
    const BuildGridHelper(
      title: 'Books',
      imageUrl: 'assets/icons/calendar.png',
      routeToPush: BooksOrderScreen(),
    ),
    const BuildGridHelper(
      title: 'Uniform',
      imageUrl: 'assets/icons/calendar.png',
      routeToPush: UniformOrderScreen(),
    ),
    const BuildGridHelper(
      title: 'Gallery',
      imageUrl: 'assets/icons/showcase.png',
      routeToPush: GalleryScreen()
    ),
    const BuildGridHelper(
      title: 'Digital Content',
      imageUrl: 'assets/icons/digitalContent.png',
      routeToPush: NoRoute(title: 'Digital Content'),
    ),
    const BuildGridHelper(
      title: 'Time Table',
      imageUrl: 'assets/icons/timetable.png',
      routeToPush: NoRoute(
        title: 'Time Table',
      ),
    ),
    const BuildGridHelper(
      title: 'Progress Report',
      imageUrl: 'assets/icons/progress.png',
      routeToPush: NoRoute(
        title: 'Progress Report',
      ),
    ),
    const BuildGridHelper(
      title: 'Track My Child',
      imageUrl: 'assets/icons/mapIcon.png',
      routeToPush: TrackChildScreen(
        whereToCome: "other",
      ),
    ),
    const BuildGridHelper(
      title: 'About Us',
      imageUrl: 'assets/icons/aboutus.png',
      routeToPush: NoRoute(
        title: 'About Us',
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: appBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: scaffoldHorizontalPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Neumorphic(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Neumorphic(
                        style: const NeumorphicStyle(boxShape: NeumorphicBoxShape.circle(),depth: 8,border: NeumorphicBorder(width: 2)),
                        child: Image.asset(
                          'assets/images/boyImage.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                      const SizedBox(
                        width: 11.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Riyansh',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 2.0,
                          ),
                          Text(
                            'VIIth - C',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Neumorphic(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(top: 18,right: 10),
                  child: const Icon(
                    Icons.compare_arrows,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            AnimationLimiter(
              child: GridView.builder(
                shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: buildGridHelper.length,
                  padding: const EdgeInsets.only(bottom: 70),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    var data = buildGridHelper[index];
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 400),
                      columnCount: 3,
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: BuildGrid(
                            imageUrl: data.imageUrl,
                            title: data.title,
                            pathToPush: data.routeToPush,
                          ),
                        ),
                      ),
                    );
                  },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BuildGrid extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Widget pathToPush;


  const BuildGrid({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.pathToPush,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => pathToPush));
      },
      child: Neumorphic(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              height: 34.0,
              width: 27.0,
            ),
            const SizedBox(
              height: 10.0,
            ),
            FittedBox(
              child: Text(
                title,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 10.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BuildGridHelper {
  final String title;
  final String imageUrl;
  final Widget routeToPush;

  const BuildGridHelper({
    required this.title,
    required this.imageUrl,
    required this.routeToPush,
  });
}
