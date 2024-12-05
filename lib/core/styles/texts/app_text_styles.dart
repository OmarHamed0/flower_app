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
  static TextStyle font20WeightBold = TextStyle(
      fontWeight: AppFontWeights.bold,
      fontSize: 20.sp,
      fontFamily: AppFonts.kPrimaryFont,
      color: AppColors.kBlack
  );
  static TextStyle font16WeightMedium = TextStyle(
      fontSize: 16.sp,
      fontFamily: AppFonts.kPrimaryFont,
      fontWeight: AppFontWeights.medium
  );

  static TextStyle font13WeightNormal =  TextStyle(
      fontWeight: AppFontWeights.normal,
      fontFamily: AppFonts.kPrimaryFont,
      color: AppColors.kBlack,
      fontSize: 13.sp
  );
  static TextStyle font12WeightNormal =  TextStyle(
      fontWeight: AppFontWeights.normal,
      fontFamily: AppFonts.kPrimaryFont,
      color: AppColors.kGray,
      fontSize: 12.sp
  );

  static TextStyle font14WeightNormal =  TextStyle(
    fontFamily: AppFonts.kPrimaryFont,
    fontSize: 14.sp,
    fontWeight: AppFontWeights.normal,
    color: AppColors.kWhite70
  );

  static TextStyle font12Gray400Weight = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.kGray,
  );
  static TextStyle font12BlackBase400Weight = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.kBlackBase,
  );

  static TextStyle font12BlackBase600Weight = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.kBlackBase,
  );


  static TextStyle font13White70Weight500 = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.kWhite70,
  );

  static TextStyle font14Gray400Weight70 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.kGray,
  );

  static TextStyle font14BlackBase400Weight = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.kBlackBase,
  );

  static TextStyle font14BlackBase500Weight = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.kBlackBase,
      fontFamily: AppFonts.kPrimaryFont
  );
  static TextStyle font16White500Weight = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.kWightBase,
  );
  static TextStyle font16BlackBase400Weight = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.kBlackBase,
  );
  static TextStyle font16MainColor500Weight = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.mainColor,
  );

  static TextStyle font20Black500Weight = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.kBlack,
  );
  static TextStyle font18Grey500Weight = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.kGray,
  );

  static TextStyle font18BlackMedium = TextStyle(
    fontSize: 18.sp,
    fontWeight: AppFontWeights.medium,
    color: AppColors.kBlack,
  );
  static TextStyle font18BaseColorSemiBold = TextStyle(
    fontSize: 18.sp,
    fontWeight: AppFontWeights.semiBold,
    color: AppColors.kBaseColor,
  );

}