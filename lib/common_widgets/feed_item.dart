import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:path_provider/path_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:school_project/common_widgets/text_widget.dart';
import 'package:school_project/screens/comment_screen/comment_screen.dart';
import 'package:school_project/utils/app_colors.dart';
import 'package:school_project/utils/app_images.dart';
import 'package:school_project/utils/dialogs.dart';
import 'package:school_project/utils/helper_methods.dart';
import 'package:share_plus/share_plus.dart';


import '../modals/feed_modal.dart';

class FeedItem extends StatefulWidget {
  final FeedModal feedData;
  const FeedItem({Key? key, required this.feedData}) : super(key: key);

  @override
  State<FeedItem> createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {

  CarouselController carouselController = CarouselController();

  int currentPage = 1;
  bool isLiked = false;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(AppImages.appIcon),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CommonText(
                      text: "The Kids File",
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                      fontSize: 14,
                    ),
                    // CommonText(
                    //   text: widget.feedData.email ?? '',
                    //   color: AppColors.grey2,
                    //   fontWeight: FontWeight.bold,
                    //   fontSize: 12,
                    // ),
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
                      itemCount: widget.feedData.images?.length,
                      carouselController: carouselController,
                      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                        return GestureDetector(
                          onTap: (){
                            Dialogs().previewImage (imagePath: (widget.feedData.images?[itemIndex]??''), context: context);
                          },
                          child: Card(
                            elevation: 0,
                            child: Image.asset(
                              widget.feedData.images?[itemIndex] ?? '',
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
                        color: Colors.grey.shade800.withOpacity(0.6),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text("$currentPage/${widget.feedData.images?.length}",style: const TextStyle(color: Colors.white,fontSize: 10,fontWeight: FontWeight.bold),),
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
                    setState(() {
                      isLiked = !isLiked;
                    });
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
                          color: isLiked ? Colors.red : Colors.grey,
                        ),
                      ),
                      widthGap(5),
                      const CommonText(
                        text: '44',
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
                      const CommonText(
                        text: '20',
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

  Future<void> _bottomsheet(BuildContext context) async {
    return await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      children: [

                                        const CircleAvatar(
                                          radius: 22,
                                          backgroundColor: AppColors.grey,
                                          backgroundImage:
                                          AssetImage(AppImages.adImage),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        CommonText(
                                          text: widget.feedData.name ?? '',
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.black,
                                          fontSize: 14,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const CommonText(
                                          text: 'This is best pic',
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.grey2,
                                          fontSize: 14,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: AppColors.grey,
                                  thickness: 1,
                                  height: 5,
                                )
                              ],
                            );
                          },
                          itemCount: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
