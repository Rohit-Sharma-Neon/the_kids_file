import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:school_project/common_widgets/base_app_bar.dart';
import 'package:school_project/screens/notification/notification_detail_screen.dart';
import 'package:school_project/utils/app_colors.dart';
import 'package:school_project/utils/sizes.dart';

class NotificationScreen extends StatefulWidget {
  final String whereToCome;
  const NotificationScreen({Key? key, required this.whereToCome})
      : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: AnimationLimiter(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            padding: const EdgeInsets.only(right: scaffoldHorizontalPadding,left: scaffoldHorizontalPadding,top: 20,bottom: 80),
            itemCount: _notification.length,
            itemBuilder: (context, index) {
              var notification = _notification[index];
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 400),
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child: NotificationStyle(
                        notificationType: notification.notificationType,
                        notificationTitle: notification.notificationTitle,
                        notificationMessage: notification.notificationMessage,
                        isRead: notification.isRead,
                        createdAt: notification.createdAt),
                  ),
                ),
              );
            }),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return BaseAppBar(
      title: 'Notification(6)',
      actions: [
        PopupMenuButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          color: AppColors.primaryColor,
          itemBuilder: (BuildContext context) {
            return <PopupMenuItem<String>>[
              const PopupMenuItem<String>(
                value: '',
                child: Text('Mark All As Read'),
              ),
              const PopupMenuItem<String>(
                value: '',
                child: Text('Mark All As Unread'),
              ),
              const PopupMenuItem<String>(
                value: '',
                child: Text('Delete All'),
              ),
            ];
          },
          child: SizedBox(
            child: Neumorphic(
              child: const Icon(
                Icons.more_horiz,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  final List<NotificationStyle> _notification = const [
    NotificationStyle(
        notificationType: 'General',
        notificationTitle: 'Lorem Ipsum is simply',
        isRead: false,
        notificationMessage: 'Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum is simply dummy...',
        createdAt: '23-12-2022 / 04:54 PM'),
    NotificationStyle(
        notificationType: 'Riyansh',
        notificationTitle: 'Pending Fees',
        isRead: false,
        notificationMessage:
        'Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum is simply dummy...',
        createdAt: '24-12-2022 / 11:54 AM'),
    NotificationStyle(
        notificationType: 'Divyanshi',
        notificationTitle: 'Payment',
        isRead: true,
        notificationMessage:
        'Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum is simply dummy...',
        createdAt: '23-12-2022 / 04:54 PM'),
    NotificationStyle(
        notificationType: 'General',
        notificationTitle: 'Attendance',
        isRead: false,
        notificationMessage:
        'Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum is simply dummy...',
        createdAt: '24-12-2022 / 11:54 AM'),
    NotificationStyle(
        notificationType: 'Riyansh',
        notificationTitle: 'Fees Submitted',
        isRead: true,
        notificationMessage:
        'Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum is simply dummy...',
        createdAt: '23-12-2022 / 04:54 PM'),
    NotificationStyle(
        notificationType: 'General',
        notificationTitle: 'Absent',
        isRead: false,
        notificationMessage:
        'Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum is simply dummy...',
        createdAt: '23-12-2022 / 04:54 PM'),
  ];
}

class NotificationStyle extends StatelessWidget {
  final String notificationType;
  final String notificationTitle;
  final String notificationMessage;
  final String createdAt;
  final bool isRead;

  const NotificationStyle({
    Key? key,
    required this.notificationType,
    required this.notificationTitle,
    required this.notificationMessage,
    required this.createdAt,
    required this.isRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        PersistentNavBarNavigator.pushNewScreen(context, screen: NotificationDetailScreen(title: notificationTitle,));
      },
      child: Neumorphic(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
        style: NeumorphicStyle(depth: isRead ? -10 : 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              notificationTitle,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              notificationMessage,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 2.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  createdAt,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 11,
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Neumorphic(
                    style: NeumorphicStyle(color: Colors.red.shade300),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
