import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Dialogs{
  previewImage({required BuildContext context, required String imagePath}){
    showGeneralDialog(
        context: context,
        barrierColor: Colors.grey.withOpacity(0.7),
        transitionBuilder: (ctx, a1, a2, child) {
          var curve = Curves.easeInOut.transform(a1.value);
          return Transform.scale(
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
          );
        },
        transitionDuration: const Duration(milliseconds: 150),
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return Container();
  });
  }
}