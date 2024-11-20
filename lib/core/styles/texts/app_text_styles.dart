import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/fonts/app_font_weight.dart';
import 'package:flower_app/core/styles/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// class contains all App main Text style
class AppTextStyles{
  AppTextStyles._();

  static TextStyle font20WeightMedium = TextStyle(
    fontWeight: AppFontWeights.medium,
    fontSize: 20.sp,
    fontFamily: AppFonts.kPrimaryFont,
    color: AppColors.kBlack
  );

  static TextStyle font16WeightMedium = TextStyle(
      fontSize: 16.sp,
      fontFamily: AppFonts.kPrimaryFont,
      fontWeight: AppFontWeights.medium);

  static TextStyle font13WeightNormal =  TextStyle(
      fontWeight: AppFontWeights.normal,
      fontFamily: AppFonts.kPrimaryFont,
      color: AppColors.kBlack,
      fontSize: 13.sp);
  static TextStyle font12WeightNormal = TextStyle(
      fontWeight: AppFontWeights.normal,
      fontFamily: AppFonts.kPrimaryFont,
      color: AppColors.kGray,
      fontSize: 12.sp);

  static TextStyle font14WeightNormal =  TextStyle(
    fontFamily: AppFonts.kPrimaryFont,
    fontSize: 14.sp,
    fontWeight: AppFontWeights.normal,
    color: AppColors.kWhite70
  );

}