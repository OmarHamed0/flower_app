import 'package:flower_app/common/common.dart';

import '../../../../core/functions/spacing.dart';
import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/styles/texts/app_text_styles.dart';

class ArriveTimeRow extends StatelessWidget {
  const ArriveTimeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Icon(
          Icons.access_time,
          color: AppColors.kBlackBase,
        ),
        horizontalSpace(4),
        Text(
          AppLocalizations.of(context)!.schedule,
          style: AppTextStyles.font14BlackBase400Weight,
        ),
        horizontalSpace(4),
        Text(
          "Arrive by 03 Sep 2024, 11:00 AM ",
          style: AppTextStyles.font14WeightNormal
              .copyWith(color: AppColors.kSuccess),
        )
      ],
    );
  }
}
