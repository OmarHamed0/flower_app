import '../../../../common/common.dart';
import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/styles/texts/app_text_styles.dart';
import '../../managers/checkout/checkout_view_model.dart';

class PaymentMethodItemCard extends StatelessWidget {
  final String paymentMethod;
  final PaymentMethodEnum value;
  final PaymentMethodEnum groupValue;
  final ValueChanged<PaymentMethodEnum?> onChanged;

  const PaymentMethodItemCard({
    super.key,
    required this.paymentMethod,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Replace with AppColors.kWhiteBase if needed
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Replace with AppColors.kBlackBase if needed
            spreadRadius: 0,
            blurRadius: 24,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              paymentMethod,
              style:  AppTextStyles.font16WeightMedium,// Replace with AppTextStyles if needed
            ),
            Radio<PaymentMethodEnum>(
              activeColor: AppColors.kBaseColor,
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}