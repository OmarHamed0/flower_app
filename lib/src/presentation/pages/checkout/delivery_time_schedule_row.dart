import 'package:flower_app/common/common.dart';

import '../../../../core/styles/texts/app_text_styles.dart';

class DeliveryTimeScheduleRow extends StatelessWidget {
  const DeliveryTimeScheduleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.deliveryTime,
            style: AppTextStyles.font18BlackMedium,
          ),
          Text(
            AppLocalizations.of(context)!.schedule,
            style: AppTextStyles.font18BaseColorSemiBold,
          )
        ],
      );
  }
}
