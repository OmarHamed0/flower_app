import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/src/data/api/core/error/error_handler.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_actions.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_states.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_view_model.dart';
import 'package:flower_app/src/presentation/widgets/app_text_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/spacing.dart';

class TotalPlaceOrderContainer extends StatelessWidget {
  const TotalPlaceOrderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CheckoutViewModel>();
    return BlocBuilder<CheckoutViewModel, CheckOutStates>(
      builder: (context, state) {
        if (state is LoadingState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Loading...'),
            ),
          );
        } else if (state is FailGetTotalPriceState) {
          return Center(
            child: Text(ErrorHandler.fromException(
                    state.exception!, AppLocalizations.of(context)!)
                .errorMassage),
          );
        } else if (state is TotalPriceState) {
          return Padding(
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
                    Text(state.totalPrice.toString(),
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
                    Text(state.deliveryFee.toString(),
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
                    Text("${state.totalPrice! + state.deliveryFee!}",
                        style: AppTextStyles.font18BlackMedium)
                  ],
                ),
                verticalSpace(24),
                AppTextButton(
                  borderRadius: BorderRadius.circular(100),
                  backgroundColor: AppColors.kBaseColor,
                  buttonText: AppLocalizations.of(context)!.placeOrder,
                  textStyle: AppTextStyles.font16White500Weight,
                  onPressed: () {
                    viewModel.doAction(PlaceOrderAction());
                  },
                ),
                verticalSpace(16),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
