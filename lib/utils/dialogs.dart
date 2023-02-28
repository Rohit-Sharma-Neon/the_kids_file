import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:provider/provider.dart';
import 'package:school_project/providers/dashboard_provider.dart';

class Dialogs{
  previewImage({required BuildContext context, required String imagePath}){
    bool isClosePressed = false;
    showGeneralDialog(
        context: context,
        barrierColor: Colors.grey.withOpacity(0.7),
        transitionBuilder: (ctx, a1, a2, child) {
          var curve = Curves.easeInOut.transform(a1.value);
          return GestureDetector(
            onTap: (){
              isClosePressed = true;
              if (isClosePressed) {
                Navigator.pop(ctx);
              }
            },
            child: Scaffold(
              extendBody: true,
              backgroundColor: Colors.transparent,
              bottomNavigationBar: Neumorphic(
                  margin: const EdgeInsets.only(bottom: 25),
                  padding: const EdgeInsets.all(20),
                  style: const NeumorphicStyle(boxShape: NeumorphicBoxShape.circle(),depth: 8),
                  child: const Icon(Icons.close_rounded),
              ),
              body: Transform.scale(
                scale: curve,
                child: Dialog(
                  backgroundColor: Colors.grey.withOpacity(0.7),
                  insetPadding: EdgeInsets.zero,
                  child: Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      child: PhotoView(
                        imageProvider: NetworkImage(imagePath),
                        initialScale: PhotoViewComputedScale.contained * 1.0,
                        maxScale: 2.0,
                        minScale: 0.2,
                        backgroundDecoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                      )
                  ),
                ),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 150),
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return Container();
  });
  }
  previewMultipleImages({required BuildContext context, required List<String> imagePaths,required int tapIndex}){
    final PageController pageController = PageController(initialPage: tapIndex);
    showGeneralDialog(
        context: context,
        barrierColor: Colors.grey.withOpacity(0.7),
        transitionBuilder: (ctx, a1, a2, child) {
          var curve = Curves.easeInOut.transform(a1.value);
          return GestureDetector(
            onTap: (){
                Navigator.pop(ctx);
            },
            child: Scaffold(
              extendBody: true,
              backgroundColor: Colors.transparent,
              bottomNavigationBar: Neumorphic(
                margin: const EdgeInsets.only(bottom: 25),
                padding: const EdgeInsets.all(20),
                style: const NeumorphicStyle(boxShape: NeumorphicBoxShape.circle(),depth: 8),
                child: const Icon(Icons.close_rounded),
              ),
              body: Transform.scale(
                scale: curve,
                child: Dialog(
                  backgroundColor: Colors.grey.withOpacity(0.7),
                  insetPadding: EdgeInsets.zero,
                  child: Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      child: PhotoViewGallery.builder(
                        pageController: pageController,
                        backgroundDecoration: const BoxDecoration(
                          color: Colors.transparent,
                        ), itemCount: imagePaths.length,
                        loadingBuilder: (context, progress) => const Center(
                          child: SizedBox(
                            width: 20.0,
                            height: 20.0,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        builder: (BuildContext context, int index) {
                          return PhotoViewGalleryPageOptions(
                            imageProvider: AssetImage(imagePaths[index]),
                            initialScale: PhotoViewComputedScale.contained * 1.0,
                            minScale: PhotoViewComputedScale.contained * 0.8,
                            maxScale: PhotoViewComputedScale.covered * 1.2,
                            // heroAttributes: PhotoViewHeroAttributes(tag: imagePaths[index]),
                          );
                        },
                      )
                  ),
                ),
              ),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 150),
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return Container();
        });
  }
  showLoader({required BuildContext context}){
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: const Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Center(
              child: CircularProgressIndicator(),
            )
          ),
        );
      },
    );
  }
  logOutDialog({required BuildContext context}){
    AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.scale,
        title: 'Waring',
        desc: 'Are you sure you want to logout?',
        btnCancelOnPress: () {},
        btnOkOnPress: () {
          Provider.of<DashBoardProvider>(context, listen: false).logOutUser();
        },
    ).show();
  }
}