import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:school_project/api_services/custom_model/global_notification_model.dart';
import 'package:school_project/common_widgets/base_app_bar.dart';
import 'package:school_project/screens/notification/notification_detail_screen.dart';
import 'package:school_project/utils/app_colors.dart';
import 'package:school_project/utils/sizes.dart';

class GlobalNotificationScreen extends StatefulWidget {
  const GlobalNotificationScreen({Key? key}) : super(key: key);

  @override
  State<GlobalNotificationScreen> createState() => _GlobalNotificationScreenState();
}

class _GlobalNotificationScreenState extends State<GlobalNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: AnimationLimiter(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            padding: const EdgeInsets.only(right: scaffoldHorizontalPadding,left: scaffoldHorizontalPadding,top: 20,bottom: 80),
            itemCount: notification.length,
            itemBuilder: (context, index) {
              var notificationModel = notification[index];
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 400),
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child: NotificationStyle(index: index, globalNotificationModel: notificationModel,),
                  ),
                ),
              );
            },
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return BaseAppBar(
      title: 'Notification(6)',
      leading: const SizedBox.shrink(),
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

  final List<GlobalNotificationModel> notification = [
    GlobalNotificationModel(
      title: "Lorem Ipsum is simply",
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy...",
      link: "https://picsum.photos/200/300",
      isRead: false,
    ),
    GlobalNotificationModel(
      title: "Riyansh",
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy...",
      link: "https://picsum.photos/200/300",
      isRead: false,
    ),
    GlobalNotificationModel(
      title: "Payment",
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy...",
      link: "",
      isRead: false,
    ),
    GlobalNotificationModel(
      title: "Attendance",
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy...",
      link: "https://picsum.photos/200/300",
      isRead: false,
    ),
    GlobalNotificationModel(
      title: "Rohit",
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is simply dummy...",
      link: "",
      isRead: false,
    ),
  ];

}

class NotificationStyle extends StatelessWidget {
  final int index;
  final GlobalNotificationModel globalNotificationModel;
  const NotificationStyle({
    Key? key,
    required this.index, required this.globalNotificationModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        PersistentNavBarNavigator.pushNewScreen(context, screen: NotificationDetailScreen(title: globalNotificationModel.title??"",));
      },
      child: Neumorphic(
        margin: const EdgeInsets.symmetric(vertical: 10),
        // padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
        style: NeumorphicStyle(depth: (globalNotificationModel.isRead??false) ? -10 : 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            (globalNotificationModel.link??"").isEmpty ? const SizedBox.shrink() : Image.network(height: 100,width: double.infinity,cacheHeight: 100,(globalNotificationModel.link??""),fit: BoxFit.fill),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    globalNotificationModel.title??"",
                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    globalNotificationModel.description??"",
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
                        globalNotificationModel.createdAt??"",
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
          ],
        ),
      ),
    );
  }


}
