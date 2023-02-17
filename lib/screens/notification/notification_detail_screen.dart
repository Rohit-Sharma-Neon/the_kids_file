import 'package:flutter/material.dart';
import 'package:school_project/utils/app_colors.dart';

class NotificationDetailScreen extends StatelessWidget {
  const NotificationDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBgColor,
      appBar: AppBar(
        title: const Text(
          'Notification',
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lorem Ipsum is simply',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              "Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum is simply dummy LoremIpsum is simply dummy text of the printing and type setting industry. Lorem Ipsum is Lorem Ipsum is simply dummy text of the printing and type setting industry. Lorem Ipsum is simply dummy Lorem Ipsum is simply dummy text",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 12.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Stack(
              children: [
                Container(
                  child: Image.asset('assets/images/schoolGroupImage2.png'),
                ),
                Positioned(
                  top: 8.0,
                  right: 8.0,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_downward,
                      color: AppColors.pageBgColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  child: Image.asset('assets/images/schoolGroupImage.png'),
                ),
                Positioned(
                  child: Container(
                    height: 36.0,
                    width: 36.0,
                    child: Image.asset(
                      'assets/images/play.png',
                      fit: BoxFit.contain,
                      height: 10.0,
                      width: 10.0,
                    ),
                  ),
                ),
                Positioned(
                  top: 8.0,
                  right: 8.0,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_downward,
                      color: AppColors.pageBgColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
