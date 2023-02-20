import 'package:flutter/material.dart';
import 'package:school_project/common_widgets/animated_column.dart';
import 'package:school_project/common_widgets/base_app_bar.dart';
import 'package:school_project/utils/app_colors.dart';
import 'package:school_project/utils/sizes.dart';

class NotificationDetailScreen extends StatelessWidget {
  const NotificationDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: const BaseAppBar(
        title: "Notification Detail"),
      body: AnimatedColumn(
        padding: const EdgeInsets.all(scaffoldHorizontalPadding),
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
                    color: AppColors.primaryColor,
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
                    color: AppColors.primaryColor,
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
    );
  }
}
