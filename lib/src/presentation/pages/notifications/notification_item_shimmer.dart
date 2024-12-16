import 'package:flower_app/common/common.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';

class NotificationItemShimmer extends StatelessWidget {
  const NotificationItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Simulated Icon Placeholder
                Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: AppColors.kWhiteBase,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title Placeholder
                      Container(
                        width: 120,
                        height: 16,
                        decoration: BoxDecoration(
                          color: AppColors.kWhiteBase,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      verticalSpace(8),
                      // Body Placeholder
                      Container(
                        width: double.infinity,
                        height: 12,
                        decoration: BoxDecoration(
                          color: AppColors.kWhiteBase,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      verticalSpace(8),
                      Container(
                        width: 150,
                        height: 12,
                        decoration: BoxDecoration(
                          color: AppColors.kWhiteBase,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 1,
          color: AppColors.kWhite70,
        ),
      ],
    );
  }
}
