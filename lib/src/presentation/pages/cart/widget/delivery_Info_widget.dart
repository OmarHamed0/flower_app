import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/styles/fonts/app_fonts.dart';

import '../../../../../core/styles/colors/app_colors.dart';

class DeliveryInfoWidget extends StatelessWidget {
  const DeliveryInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_on_rounded,
          color: AppColors.kGray,
        ),
        Text(
          "Deliver to",
          style: AppFonts.font16Grey500Weight,
        ),
        Text("2XVP+XC - Sheikh Zayed.....",
            style: AppFonts.font16Grey500Weight),
        const Icon(
          Icons.keyboard_arrow_down_sharp,
          color: AppColors.kGray,
          weight: 40,
          size: 33,
        )
      ],
    );
  }
}
