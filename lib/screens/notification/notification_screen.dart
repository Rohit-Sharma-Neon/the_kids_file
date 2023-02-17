import 'package:flutter/material.dart';
import 'package:school_project/screens/notification/notification_detail_screen.dart';
import 'package:school_project/utils/app_colors.dart';

class NotificationScreen extends StatefulWidget {
  final String whereToCome;
  const NotificationScreen({Key? key, required this.whereToCome})
      : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  PreferredSizeWidget appBar() {
    return AppBar(
      title: const Text(
        'Notification',
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: widget.whereToCome == "NavBar"
          ? const SizedBox()
          : GestureDetector(
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
        PopupMenuButton(
          child: Container(
            margin: const EdgeInsets.only(right: 17.0),
            child: const Icon(
              Icons.more_horiz,
              color: AppColors.primary,
            ),
          ),
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
        ),
      ],
    );
  }

  final List<NotificationStyle> _notification = const [
    NotificationStyle(
        notificationType: 'General',
        notificationTitle: 'Lorem Ipsum is simply',
        notificationMessage:
        'Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum is simply dummy...',
        createdAt: '23-12-2022 / 04:54 PM'),
    NotificationStyle(
        notificationType: 'Riyansh',
        notificationTitle: 'Pending Fees',
        notificationMessage:
        'Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum is simply dummy...',
        createdAt: '24-12-2022 / 11:54 AM'),
    NotificationStyle(
        notificationType: 'Divyanshi',
        notificationTitle: 'Payment',
        notificationMessage:
        'Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum is simply dummy...',
        createdAt: '23-12-2022 / 04:54 PM'),
    NotificationStyle(
        notificationType: 'General',
        notificationTitle: 'Lorem Ipsum is simply',
        notificationMessage:
        'Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum is simply dummy...',
        createdAt: '24-12-2022 / 11:54 AM'),
    NotificationStyle(
        notificationType: 'Riyansh',
        notificationTitle: 'Pending Fees',
        notificationMessage:
        'Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum is simply dummy...',
        createdAt: '23-12-2022 / 04:54 PM'),
    NotificationStyle(
        notificationType: 'General',
        notificationTitle: 'Lorem Ipsum is simply',
        notificationMessage:
        'Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum is simply dummy...',
        createdAt: '23-12-2022 / 04:54 PM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: _notification.length,
          itemBuilder: (context, index) {
            var notification = _notification[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotificationDetailScreen(),
                  ),
                );
              },
              child: NotificationStyle(
                  notificationType: notification.notificationType,
                  notificationTitle: notification.notificationTitle,
                  notificationMessage: notification.notificationMessage,
                  createdAt: notification.createdAt),
            );
          }),
    );
  }
}

class NotificationStyle extends StatelessWidget {
  final String notificationType;
  final String notificationTitle;
  final String notificationMessage;
  final String createdAt;

  const NotificationStyle({
    Key? key,
    required this.notificationType,
    required this.notificationTitle,
    required this.notificationMessage,
    required this.createdAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 3.0,
              horizontal: 10.0,
            ),
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.primary,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(25.0)),
            child: Text(
              notificationType,
              style: const TextStyle(color: AppColors.primary, fontSize: 10.0),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            notificationTitle,
            style: const TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            notificationMessage,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 2.0,
          ),
          Row(
            children: [
              Text(
                createdAt,
                style: const TextStyle(
                  color: AppColors.lightBlack,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.delete,
                  color: AppColors.pageBgColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
