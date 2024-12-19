import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/src/data/api/core/error/error_handler.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_actions.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_states.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_view_model.dart';
import 'package:flower_app/src/presentation/widgets/app_text_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/functions/spacing.dart';

class TotalPlaceOrderContainer extends StatelessWidget {
  const TotalPlaceOrderContainer({super.key});

  Widget buildShimmer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          verticalSpace(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              shimmerBox(width: 100.w, height: 16.h),
              shimmerBox(width: 50.w, height: 16.h),
            ],
          ),
          verticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              shimmerBox(width: 100.w, height: 16.h),
              shimmerBox(width: 50.w, height: 16.h),
            ],
          ),
          verticalSpace(16),
          Container(height: 1, color: AppColors.kBlack),
          verticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              shimmerBox(width: 80.w, height: 18.h),
              shimmerBox(width: 60.w, height: 18.h),
            ],
          ),
          verticalSpace(24),
          shimmerBox(width: double.infinity, height: 48.h, borderRadius: 100),
          verticalSpace(16)
        ],
      ),
    );
  }

  Widget shimmerBox({required double width, required double height, double borderRadius = 0}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CheckoutViewModel>();
    num _subTotal = 0;
    num _deliveryFee = 0;
    num _totalPrice = 0;

    return BlocBuilder<CheckoutViewModel, CheckOutStates>(
      builder: (context, state) {
        if (state is LoadingState) {
          return buildShimmer();
        } else if (state is FailGetTotalPriceState) {
          return Center(
            child: Text(
              ErrorHandler.fromException(
                state.exception!,
                AppLocalizations.of(context)!,
              ).errorMassage,
            ),
          );
        } else if (state is TotalPriceState) {
          _subTotal = state.totalPrice!;
          _deliveryFee = state.deliveryFee!;
          _totalPrice = state.totalPrice! + state.deliveryFee!;
        }

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
                  Text(_subTotal.toString(),
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
                  Text(_deliveryFee.toString(),
                      style: AppTextStyles.font16White500Weight
                          .copyWith(color: AppColors.kWhite70))
                ],
              ),
              verticalSpace(16),
              Container(height: 1, color: AppColors.kBlack),
              verticalSpace(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)!.total,
                      style: AppTextStyles.font18BlackMedium),
                  Text(_totalPrice.toString(),
                      style: AppTextStyles.font18BlackMedium),
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
      },
    );
  }
}
