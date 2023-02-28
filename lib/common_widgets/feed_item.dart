import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:path_provider/path_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:school_project/api_services/api_models/feed_model.dart';
import 'package:school_project/common_widgets/text_widget.dart';
import 'package:school_project/providers/dashboard_provider.dart';
import 'package:school_project/screens/comment_screen/comment_screen.dart';
import 'package:school_project/utils/app_colors.dart';
import 'package:school_project/utils/app_images.dart';
import 'package:school_project/utils/app_string.dart';
import 'package:school_project/utils/dialogs.dart';
import 'package:school_project/utils/helper_methods.dart';
import 'package:share_plus/share_plus.dart';


class FeedItem extends StatefulWidget {
  final FeedData feedData;
  const FeedItem({Key? key, required this.feedData}) : super(key: key);

  @override
  State<FeedItem> createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {

  CarouselController carouselController = CarouselController();

  int currentPage = 1;
  bool isLiked = false;

  late DashBoardProvider dashBoardProvider;

  @override
  void initState() {
    dashBoardProvider = Provider.of<DashBoardProvider>(context,listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
          depth: 5,
          intensity: 5.0,
          lightSource: LightSource.topLeft,
          color: AppColors.primaryColor),
      margin: const EdgeInsets.symmetric(horizontal: 13,vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    (imageBaseUrl)+(widget.feedData.headingPhoto??""),
                    fit: BoxFit.fill,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return Image.asset(AppImages.appIcon,width: 40,height: 40,);
                    },
                    width: 40,
                    height: 40,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(
                      text: widget.feedData.title??"",
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                      fontSize: 14,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                SizedBox(
                  height: deviceHeight(context) * 0.50,
                  width: double.infinity,
                  child: CarouselSlider.builder(
                      itemCount: widget.feedData.imagesList?.length??0,
                      carouselController: carouselController,
                      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                        return GestureDetector(
                          onTap: (){
                            Dialogs().previewImage (imagePath: (imageBaseUrl)+(widget.feedData.imagesList?[itemIndex]??""), context: context);
                          },
                          child: Card(
                            elevation: 0,
                            child: Image.network(
                              (imageBaseUrl)+(widget.feedData.imagesList?[itemIndex]??""),
                              fit: BoxFit.fill,
                              filterQuality: FilterQuality.medium,
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                          autoPlay: true,
                          autoPlayAnimationDuration: const Duration(milliseconds: 800),
                          enlargeCenterPage: false,
                          // aspectRatio: 1.2,
                          height: 250,
                          viewportFraction: 1.0,
                          disableCenter: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentPage = (index+1);
                            });
                          })),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    height: 25,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                        color: Colors.grey.shade800.withOpacity(0.8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text("$currentPage/${widget.feedData.imagesList?.length}",style: const TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12,bottom: 18,right: 12,left: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    if (dashBoardProvider.isLoggedIn) {
                      setState(() {
                        if ((widget.feedData.isLikeStatus) == 0) {
                          widget.feedData.isLikeStatus = 1;
                          widget.feedData.likeCount = (widget.feedData
                              .likeCount ?? 0) + 1;
                        } else {
                          widget.feedData.isLikeStatus = 0;
                          widget.feedData.likeCount = (widget.feedData
                              .likeCount ?? 0) - 1;
                        }
                      });
                    }else{
                      dashBoardProvider.changeTabIndex(tabIndex: 2);
                    }
                  },
                  child: Row(
                    children: [
                      Neumorphic(
                        padding: const EdgeInsets.all(6),
                        style: const NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          color: AppColors.primaryColor,
                          boxShape: NeumorphicBoxShape.circle()
                        ),
                        child: Icon(
                          Icons.favorite,
                          size: 25,
                          color: (widget.feedData.isLikeStatus??0) == 0 ? Colors.grey : Colors.red,
                        ),
                      ),
                      widthGap(5),
                      CommonText(
                        text: (widget.feedData.likeCount??0).toString(),
                        color: AppColors.grey2,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ],
                  ),
                ),
                widthGap(20),
                InkWell(
                  onTap: () {
                    PersistentNavBarNavigator.pushNewScreen(context, screen: const CommentScreen());
                  },
                  child: Row(
                    children: [
                      Neumorphic(
                        padding: const EdgeInsets.all(6),
                        style: const NeumorphicStyle(
                            shape: NeumorphicShape.concave,
                            color: AppColors.primaryColor,
                            boxShape: NeumorphicBoxShape.circle()
                        ),
                        child: const Icon(
                          Icons.comment,
                          color: Colors.grey,
                        ),
                      ),
                      widthGap(5),
                      CommonText(
                        text: (widget.feedData.commenCount??0).toString(),
                        color: AppColors.grey2,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    final bytes = await rootBundle.load('assets/images/dummy_home_banner.jpeg');
                    final list = bytes.buffer.asUint8List();

                    final tempDir = await getTemporaryDirectory();
                    final file = await File('${tempDir.path}/dummy_home_banner.jpeg').create();
                    file.writeAsBytesSync(list);
                    Share.shareXFiles([XFile(file.path)], text: 'The Kids File');
                  },
                  child: Neumorphic(
                    padding: const EdgeInsets.all(6),
                    style: const NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        color: AppColors.primaryColor,
                        boxShape: NeumorphicBoxShape.circle()
                    ),
                    child: const Icon(
                      Icons.share_rounded,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
