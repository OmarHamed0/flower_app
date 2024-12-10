import 'package:flower_app/config/extensions/extensions.dart';
import 'package:flower_app/src/presentation/pages/checkout/payment_method_item_card.dart';

import '../../../../common/common.dart';
import '../../../../core/functions/spacing.dart';
import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/styles/texts/app_text_styles.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.paymentMethod,
            style: AppTextStyles.font18BlackMedium,
          ),
          verticalSpace(16),
          Container(
            decoration: BoxDecoration(
              color: AppColors.kWhiteBase,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: AppColors.kBlackBase.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 24,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.cashOnDelivery,
                    style: AppTextStyles.font16WeightMedium,
                  ),
                  Radio(value: 1, groupValue: "payment", onChanged: (value) {})
                ],
              ),
            ),
          ),
          verticalSpace(16),
          PaymentMethodItemCard(paymentMethod: AppLocalizations.of(context)!.creditCard)
        ],
      ),
    );
  }
}
