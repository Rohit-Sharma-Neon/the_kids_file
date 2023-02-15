import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  //final String fontFamily;
  final double? fontSize;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final int? maxLines;
  final double? height;
  const CommonText(
      {Key? key,
      required this.text,
      this.textAlign,
      this.color,
      //this.fontFamily = Fonts.sairaCondensed,
      this.fontSize,
      this.overflow,
      this.fontWeight,
      this.decoration,
      this.maxLines,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        height: height,
        decoration: decoration,
        // fontFamily: fontFamily,
        overflow: overflow,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
