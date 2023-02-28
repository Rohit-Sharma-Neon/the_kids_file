import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:school_project/common_widgets/base_app_bar.dart';
import 'package:school_project/common_widgets/base_loading.dart';
import 'package:school_project/common_widgets/text_widget.dart';
import 'package:school_project/api_services/custom_model/feed_modal.dart';
import 'package:school_project/providers/dashboard_provider.dart';
import 'package:school_project/providers/feed_provider.dart';
import 'package:school_project/screens/join_now/join_now_screen.dart';
import 'package:school_project/utils/app_colors.dart';
import 'package:school_project/utils/app_images.dart';
import 'package:school_project/utils/app_string.dart';
import 'package:school_project/common_widgets/feed_item.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {

  late FeedProvider feedProvider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      feedProvider = Provider.of<FeedProvider>(context,listen: false);
      feedProvider.getFeeds();
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setState(() {});
      print("Hello");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: appName,leading: SizedBox.shrink()),
      backgroundColor: AppColors.primaryColor,
      body: Consumer<FeedProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return value.isFeedLoading ? CircularProgressIndicator() : AnimationLimiter(child: ListView.builder(
              itemCount: value.feedData.length,
              shrinkWrap: true,
              padding: const EdgeInsets.only(top: 10,bottom: 100),
              itemBuilder: (context, index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    child: FadeInAnimation(
                      child: FeedItem(
                        feedData: value.feedData[index],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
