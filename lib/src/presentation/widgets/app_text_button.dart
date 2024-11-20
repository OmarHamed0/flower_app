import 'package:flower_app/core/styles/app_radius.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextButton extends StatelessWidget {
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final TextStyle textStyle;
  final VoidCallback onPressed;

  const AppTextButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    required this.buttonText,
    required this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: borderRadius ?? AppBorderRadius.s,
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(
            backgroundColor ?? AppColors.kBaseColor,
          ),
          padding: WidgetStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(
              horizontal: horizontalPadding?.w ?? 12.w,
              vertical: verticalPadding?.h ?? 14.h,
            ),
          ),
          fixedSize: WidgetStateProperty.all(
            Size(buttonWidth?.w ?? double.maxFinite, buttonHeight ?? 50.h),
          ),
          side: WidgetStateProperty.all<BorderSide>(
              BorderSide(color: borderColor ?? AppColors.kBaseColor))),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}
