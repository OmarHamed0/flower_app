import 'package:flower_app/config/extensions/extensions.dart';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/images/app_images.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common/common.dart';

class DriverDataRow extends StatelessWidget {
  const DriverDataRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(AppImages.deliveryMan),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Deleviery name",
                style: AppTextStyles.font14BlackBase500Weight,
              ),
              verticalSpace(4),
              Text(context.localization.isYourDelivery,
                  style: AppTextStyles.font14Gray500Weight70),
            ],
          ),
          InkWell(onTap: (){}, child: SvgPicture.asset(AppImages.phoneSvg),),
          InkWell(onTap: (){}, child: SvgPicture.asset(AppImages.whatsAppSvg),)
        ],
      ),
    );
  }
}
