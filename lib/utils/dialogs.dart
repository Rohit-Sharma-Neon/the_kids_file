import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:photo_view/photo_view.dart';

class Dialogs{
  previewImage({required BuildContext context, required String imagePath}){
    showGeneralDialog(
        context: context,
        barrierColor: Colors.grey.withOpacity(0.7),
        transitionBuilder: (ctx, a1, a2, child) {
          var curve = Curves.easeInOut.transform(a1.value);
          return Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: NeumorphicCloseButton(onPressed: (){Navigator.of(context, rootNavigator: true).pop(true);},
                  style: const NeumorphicStyle(boxShape: NeumorphicBoxShape.circle(),depth: 8),padding: EdgeInsets.all(20)),
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
                      imageProvider: AssetImage(imagePath),
                      maxScale: 2.0,
                      minScale: 0.2,
                      backgroundDecoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                    )
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
}