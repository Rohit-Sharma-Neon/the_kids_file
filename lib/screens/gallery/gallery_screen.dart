import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:school_project/common_widgets/base_app_bar.dart';
import 'package:school_project/utils/dialogs.dart';
import 'package:school_project/utils/sizes.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "Gallery"),
      body: AnimationLimiter(
        child: GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: dummyImages.length,
            padding: const EdgeInsets.only(right: scaffoldHorizontalPadding,left: scaffoldHorizontalPadding,top: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
            ),
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 500),
                columnCount: 3,
                child: ScaleAnimation(
                  child: FadeInAnimation(
                    child: GestureDetector(onTap: (){
                      Dialogs().previewMultipleImages(context: context, imagePaths: dummyImages,tapIndex: index);
                    },child: ClipRRect(borderRadius: BorderRadius.circular(8),child: Image.asset(dummyImages[index],fit: BoxFit.fill))),
                  ),
                ),
              );
            }),
      )
    );
  }

  List<String> dummyImages = [
    "assets/delete_images/event1.jpeg",
    "assets/delete_images/event2.jpeg",
    "assets/delete_images/event3.jpeg",
    "assets/delete_images/event4.jpeg",
    "assets/delete_images/event5.jpeg",
  ];
}
