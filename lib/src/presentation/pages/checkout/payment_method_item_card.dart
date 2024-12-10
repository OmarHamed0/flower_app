import '../../../../common/common.dart';
import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/styles/texts/app_text_styles.dart';

class PaymentMethodItemCard extends StatelessWidget {
  final String paymentMethod;
  const PaymentMethodItemCard({super.key, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return    Container(
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
              AppLocalizations.of(context)!.creditCard,
              style: AppTextStyles.font16WeightMedium,
            ),
            Radio(value: 1, groupValue: "payment", onChanged: (value) {})
          ],
        ),
      ),
    );
  }
}
