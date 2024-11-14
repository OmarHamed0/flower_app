import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.label,
      required this.labelStyle,
      required this.onPressed,
      this.backgroundColor,
      this.borderColor});

  final String label;
  final TextStyle labelStyle;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor??  AppColors.kBaseColor,
          side: BorderSide(
            color: borderColor?? AppColors.kBaseColor,
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14.w),
          child: Text(
            label,
            style: labelStyle,
          ),
        ),
      ),
    );
  }
}
