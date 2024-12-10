import 'package:flower_app/common/common.dart';
import 'package:flower_app/config/extensions/extensions.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/src/presentation/pages/checkout/address_item_card.dart';
import 'package:flower_app/src/presentation/widgets/app_text_button.dart';

import '../../../../core/styles/spaceing.dart';

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.deliveryAddress,
            style: AppTextStyles.font18BlackMedium,
          ),
          verticalSpace(16),
          const AddressItemCard(),
          verticalSpace(16),
          const AddressItemCard(),
          verticalSpace(16),
          AppTextButton(
            buttonText: "+ ${AppLocalizations.of(context)!.addNew}",
            textStyle: AppTextStyles.font14WeightNormal
                .copyWith(color: AppColors.kBaseColor),
            onPressed: () {},
            borderRadius: BorderRadius.circular(100),
            backgroundColor: AppColors.kWhiteBase,
            borderColor: AppColors.kBlackBase,
          )
        ],
      ),
    );;
  }
}