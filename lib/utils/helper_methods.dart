import 'package:flutter/material.dart';

SizedBox heightGap(double height) {
  return SizedBox(
    height: height,
  );
}

SizedBox widthGap(double width) {
  return SizedBox(
    width: width,
  );
}

double deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double deviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
