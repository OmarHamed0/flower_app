import 'package:flower_app/common/common.dart';
import 'package:flower_app/config/extensions/extensions.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_view_model.dart';
import 'package:flower_app/src/presentation/pages/checkout/payment_method_item_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles/spaceing.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CheckoutViewModel>();
    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.paymentMethod,
            style: AppTextStyles.font18BlackMedium,
          ),
          verticalSpace(16),
          PaymentMethodItemCard(
            paymentMethod: AppLocalizations.of(context)!.cashOnDelivery,
            value: PaymentMethodEnum.cash,
            groupValue: viewModel.selectedPaymentMethod,
            onChanged: (PaymentMethodEnum? value) {
              setState(() {
                viewModel.selectedPaymentMethod = value!;
              });
            },
          ),
          verticalSpace(16),
          PaymentMethodItemCard(
            paymentMethod: AppLocalizations.of(context)!.creditCard,
            value: PaymentMethodEnum.creditCard,
            groupValue: viewModel.selectedPaymentMethod,
            onChanged: (PaymentMethodEnum? value) {
              setState(
                () {
                  viewModel.selectedPaymentMethod = value!;
                },
              );
            },
          )
        ],
      ),
    );
  }
}
