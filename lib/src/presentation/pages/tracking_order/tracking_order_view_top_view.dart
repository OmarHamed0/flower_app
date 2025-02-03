import 'package:flower_app/config/extensions/extensions.dart';

import '../../../../common/common.dart';
import '../../../../core/functions/spacing.dart';
import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/styles/texts/app_text_styles.dart';

class TrackingOrderViewTopView extends StatelessWidget {
  const TrackingOrderViewTopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.localization.estimatedArrival,
          style: AppTextStyles.font14BlackBase500Weight.copyWith(
              color: AppColors.kGray
          ),
        ),
        verticalSpace(8),
        Text("03 Sep 2024, 11:00 AM", style: AppTextStyles.font16WeightMedium.copyWith(
            color: AppColors.kBlackBase
        )),
        verticalSpace(16),
        Container(
          height: .5,
          color: AppColors.kGray,
        ),
      ],
    );
  }
}
