import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFonts {
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
    fontFamily: kPrimaryFont
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
  static const String kPrimaryFont = "Inter";
}
