import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/src/presentation/widgets/app_text_button.dart';

import '../../../../core/functions/spacing.dart';

class TotalContainer extends StatelessWidget {
  const TotalContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.subTotal,
                  style: AppTextStyles.font16White500Weight
                      .copyWith(color: AppColors.kWhite70)),
              Text("EGP 100",
                  style: AppTextStyles.font16White500Weight
                      .copyWith(color: AppColors.kWhite70))
            ],
          ),
          verticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.deliveryFee,
                  style: AppTextStyles.font16White500Weight
                      .copyWith(color: AppColors.kWhite70)),
              Text("EGP 10",
                  style: AppTextStyles.font16White500Weight
                      .copyWith(color: AppColors.kWhite70))
            ],
          ),
          verticalSpace(16),
          Container(
            height: 1,
            color: AppColors.kBlack,
          ),
          verticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.total,
                  style: AppTextStyles.font18BlackMedium),
              Text("EGP 110", style: AppTextStyles.font18BlackMedium)
            ],
          ),
          verticalSpace(24),
          AppTextButton(
            borderRadius: BorderRadius.circular(100),
            backgroundColor: AppColors.kBaseColor,
            buttonText: AppLocalizations.of(context)!.placeOrder,
            textStyle: AppTextStyles.font16White500Weight,
            onPressed: () {},
          ),
          verticalSpace(16),
        ],
      ),
    );
  }
}
