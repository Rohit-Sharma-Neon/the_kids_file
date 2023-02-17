import 'package:flutter/material.dart';
import 'package:school_project/screens/books%20order/books_order_screen.dart';
import 'package:school_project/screens/no_route.dart';
import 'package:school_project/screens/profile/payment_summary_screen.dart';
import 'package:school_project/screens/trackChild/track_child_screen.dart';
import 'package:school_project/screens/uniform%20order/uniform_order_screen.dart';
import 'package:school_project/utils/app_colors.dart';
import '../notification/notification_screen.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  int notificationCount = 2;

  PreferredSizeWidget appBar() {
    return AppBar(
      title: const Text(
        'Dashboard',
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      // leading: GestureDetector(
      //   onTap: () {
      //     Navigator.pop(context);
      //   },
      //   child: Container(
      //     margin: const EdgeInsets.only(right: 17.0),
      //     child: const Icon(
      //       Icons.arrow_back_ios_new,
      //       color: AppColors.primary,
      //     ),
      //   ),
      // ),
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
      routeToPush: NoRoute(
        title: 'Gallery',
      ),
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
      backgroundColor: AppColors.pageBgColor,
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome Rajeev!',
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Stack(
              children: [
                Card(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/boyImage.png',
                            width: 157.0,
                            height: 157.0,
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
                  ),
                ),
                const Positioned(
                  top: 18.0,
                  right: 13.0,
                  child: Icon(
                    Icons.compare_arrows,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: buildGridHelper.length,
                  padding: EdgeInsets.only(bottom: 50),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemBuilder: (context, index) {
                    var data = buildGridHelper[index];
                    return BuildGrid(
                      imageUrl: data.imageUrl,
                      title: data.title,
                      pathToPush: data.routeToPush,
                    );
                  }),
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
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primary,
            width: 1.0,
          ),
        ),
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
