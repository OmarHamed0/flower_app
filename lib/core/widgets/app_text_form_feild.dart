import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
      required this.labelText,
      this.hintText,
      this.controller,
      this.validator,
      this.isObscureText,
      this.suffixIcon,
      this.isReadOnly = false,
      this.focusNode,
      this.suffixWidget,
      this.hintStyle,
      this.initialValue});
  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final bool? isReadOnly;
  final FocusNode? focusNode;
  final Widget? suffixWidget;
  final TextStyle? hintStyle;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        obscureText: isObscureText ?? false,
        validator: validator,
        readOnly: isReadOnly ?? false,
        focusNode: focusNode,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: labelText,
          hintText: hintText,
          // floatingLabelStyle: const TextStyle(color: Colors.red),
          errorStyle: const TextStyle(color: AppColors.error),
          hintStyle: hintStyle ?? AppFonts.font14Gray400Weight70,
          labelStyle: AppFonts.font12Gray400Weight,
          suffixIcon: suffixIcon,
          suffix: suffixWidget,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: BorderSide(
              color: AppColors.kBlack,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: const BorderSide(
              color: AppColors.kBlack,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: const BorderSide(
              color: AppColors.error,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: const BorderSide(
              color: AppColors.error,
              width: 1.3,
            ),
          ),

          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: const BorderSide(
              color: AppColors.kBlack,
              width: 1,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: const BorderSide(
              color: AppColors.kBlack,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
