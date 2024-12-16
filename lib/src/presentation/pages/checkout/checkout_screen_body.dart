import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_view_model.dart';
import 'package:flower_app/src/presentation/pages/checkout/arrive_time_row.dart';
import 'package:flower_app/src/presentation/pages/checkout/delivery_address.dart';
import 'package:flower_app/src/presentation/pages/checkout/delivery_time_schedule_row.dart';
import 'package:flower_app/src/presentation/pages/checkout/is_gifted_toggle_form.dart';
import 'package:flower_app/src/presentation/pages/checkout/payment_methods.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'total_place_order_container.dart';

class CheckoutScreenBody extends StatelessWidget {
  const CheckoutScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CheckoutViewModel>();
    return SizedBox(
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              controller: viewModel.scrollController, // Assigned here
              scrollBehavior: const MaterialScrollBehavior(),
              slivers: [
                SliverToBoxAdapter(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      verticalSpace(24),
                      const DeliveryTimeScheduleRow(),
                      verticalSpace(16),
                      const ArriveTimeRow(),
                      verticalSpace(16),
                      const DeliveryAddress(),
                      verticalSpace(16),
                      const PaymentMethods(),
                      verticalSpace(16),
                      const IsGiftedToggleForm(),
                    ],
                  ),
                ))
              ],
            ),
          ),
          const TotalPlaceOrderContainer(),
        ],
      ),
    );
  }


}
