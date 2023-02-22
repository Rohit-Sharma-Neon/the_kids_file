import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:school_project/utils/app_colors.dart';


class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final bool isAnimate;

  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.margin = const EdgeInsets.only(bottom: 0,right: 0,left: 0),
    this.padding = const EdgeInsets.symmetric(vertical: 15),
    this.isAnimate = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideInUp(
      animate: true,
      child: NeumorphicButton(
        margin: margin,
        padding: padding,
        minDistance: double.infinity,
        style: const NeumorphicStyle(depth: 8,color: AppColors.primaryColor),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, textAlign: TextAlign.center,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
