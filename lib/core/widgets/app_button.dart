import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    this.color,
    required this.onPressed,
    this.isExpanded = false,
  });
  final String text;
  final Color? color;
  final VoidCallback onPressed;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: isExpanded ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          backgroundColor: color ?? AppColors.mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.r),
          ),
        ),
        child: Text(
          text,
          style: AppFonts.font16White500Weight,
        ),
      ),
    );
  }
}
