import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';

class OrderItemCardShimmer extends StatelessWidget {
  const OrderItemCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
      width: double.infinity,
      height: 130.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.kWhite70, width: 1.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: AppColors.baseShimmer,
            highlightColor: AppColors.highlightShimmer,
            child: Container(
              width: 100.w,
              height: 100.h,
              color: AppColors.baseShimmer,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Shimmer.fromColors(
                  baseColor: AppColors.baseShimmer,
                  highlightColor: AppColors.highlightShimmer,
                  child: Container(
                    width: double.infinity,
                    height: 12.h,
                    color: AppColors.baseShimmer,
                  ),
                ),
                verticalSpace(8),
                Shimmer.fromColors(
                  baseColor: AppColors.baseShimmer,
                  highlightColor: AppColors.highlightShimmer,
                  child: Container(
                    width: 80.w,
                    height: 16.h,
                    color: AppColors.baseShimmer,
                  ),
                ),
                verticalSpace(8),
                Shimmer.fromColors(
                  baseColor: AppColors.baseShimmer,
                  highlightColor: AppColors.highlightShimmer,
                  child: Container(
                    width: 140.w,
                    height: 12.h,
                    color: Colors.grey[300],
                  ),
                ),
                verticalSpace(16),
                Shimmer.fromColors(
                  baseColor: AppColors.baseShimmer,
                  highlightColor: AppColors.highlightShimmer,
                  child: Container(
                    width: double.infinity,
                    height: 36.h,
                    color: AppColors.baseShimmer,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
