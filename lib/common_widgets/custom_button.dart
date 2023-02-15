import 'package:flutter/material.dart';
import 'package:school_project/utils/app_colors.dart';


class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onTap;
  final double? height;

  const CustomButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.height = 54.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(50.0),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 10.0,
              ),
            ]),
        child: child,
      ),
    );
  }
}
