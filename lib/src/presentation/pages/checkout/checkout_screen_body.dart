import 'package:animate_do/animate_do.dart';
import 'package:flower_app/common/common.dart';
import 'package:flower_app/config/extensions/extensions.dart';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_actions.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_view_model.dart';
import 'package:flower_app/src/presentation/widgets/app_text_button.dart';
import 'package:flower_app/src/presentation/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../managers/checkout/checkout_states.dart';

class CheckoutScreenBody extends StatelessWidget {
  const CheckoutScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CheckoutViewModel>();
    bool isSwitched = viewModel.isSwitched;
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
                      _deliveryTimeScheduleRow(context),
                      verticalSpace(16),
                      _arriveTimeRow(context),
                      verticalSpace(16),
                      _deliveryAddress(context),
                      verticalSpace(16),
                      _paymentMethod(context),
                      verticalSpace(16),
                      BlocBuilder<CheckoutViewModel, CheckOutStates>(
                        builder: (context, stata) {
                          if (stata is SwitchToggleState) {
                            isSwitched = stata.isSwitched;
                          }
                          if (isSwitched == true) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                                viewModel.scrollController.animateTo(
                                  viewModel.scrollController.position.maxScrollExtent,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );

                            });
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Switch(
                                      dragStartBehavior: DragStartBehavior.down,
                                      activeColor: AppColors.kWhiteBase,
                                      activeTrackColor: AppColors.kBaseColor,
                                      value: isSwitched,
                                      onChanged: (value) {
                                        viewModel
                                            .doAction(SwitchToggleAction());
                                      },
                                    ),
                                    Text(
                                      "it is a gift",
                                      style: AppTextStyles.font18BlackMedium,
                                    )
                                  ],
                                ),
                                FadeInLeft(
                                  child: const AppTextField(
                                    labelText: "name",
                                    hintText: "Enter your name",
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                                verticalSpace(8),
                                FadeInLeft(
                                  child: const AppTextField(
                                    labelText: "Phone Number",
                                    hintText: "Enter the phone number",
                                    keyboardType: TextInputType.text,
                                  ),
                                ),
                                verticalSpace(16)
                              ],
                            );
                          }
                          return Row(
                            children: [
                              Switch(
                                activeColor: AppColors.kWhiteBase,
                                activeTrackColor: AppColors.kBaseColor,
                                value: isSwitched,
                                onChanged: (value) {
                                  viewModel.doAction(SwitchToggleAction());
                                },
                              ),
                              Text("it is a gift",
                                  style: AppTextStyles.font18BlackMedium)
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                verticalSpace(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("subtotal",
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
                    Text("Delivery fee",
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
                    Text("Total ", style: AppTextStyles.font18BlackMedium),
                    Text("EGP 110", style: AppTextStyles.font18BlackMedium)
                  ],
                ),
                verticalSpace(48),
                AppTextButton(
                  borderRadius: BorderRadius.circular(100),
                  backgroundColor: AppColors.kBaseColor,
                    buttonText: "Place order",
                    textStyle: AppTextStyles.font16White500Weight,
                    onPressed: () {},
                ),
                verticalSpace(16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _deliveryTimeScheduleRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.deliveryTime,
          style: AppTextStyles.font18BlackMedium,
        ),
        Text(
          AppLocalizations.of(context)!.schedule,
          style: AppTextStyles.font18BaseColorSemiBold,
        )
      ],
    );
  }

  Widget _arriveTimeRow(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.access_time,
          color: AppColors.kBlackBase,
        ),
        horizontalSpace(4),
        Text(
          AppLocalizations.of(context)!.schedule,
          style: AppTextStyles.font14BlackBase400Weight,
        ),
        horizontalSpace(4),
        Text(
          "Arrive by 03 Sep 2024, 11:00 AM ",
          style: AppTextStyles.font14WeightNormal
              .copyWith(color: AppColors.kSuccess),
        )
      ],
    );
  }

  Widget _deliveryAddress(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.deliveryAddress,
            style: AppTextStyles.font18BlackMedium,
          ),
          verticalSpace(16),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: AppColors.kWhiteBase,
              border: const Border.fromBorderSide(
                BorderSide(
                  color: AppColors.kWhiteBase,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.kBlackBase.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 24,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio(
                              value: 1,
                              groupValue: "address",
                              onChanged: (value) {}),
                          Text(
                            "Home",
                            style: AppTextStyles.font16WeightMedium,
                          ),
                        ],
                      ),
                      verticalSpace(16),
                      Text(
                        "2XVP+XC - Sheikh Zayed",
                        style: AppTextStyles.font13WeightNormal,
                      )
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit_outlined),
                  onPressed: () {},
                )
              ],
            ),
          ),
          verticalSpace(16),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: AppColors.kWhiteBase,
              border: const Border.fromBorderSide(
                BorderSide(
                  color: AppColors.kWhiteBase,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.kBlackBase.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 24,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Radio(
                              value: 1,
                              groupValue: "address",
                              onChanged: (value) {}),
                          Text(
                            "Home",
                            style: AppTextStyles.font16WeightMedium,
                          ),
                        ],
                      ),
                      verticalSpace(16),
                      Text(
                        "2XVP+XC - Sheikh Zayed",
                        style: AppTextStyles.font13WeightNormal,
                      )
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit_outlined),
                  onPressed: () {},
                )
              ],
            ),
          ),
          verticalSpace(16),
          AppTextButton(
            buttonText: AppLocalizations.of(context)!.addNew,
            textStyle: AppTextStyles.font14WeightNormal
                .copyWith(color: AppColors.kBaseColor),
            onPressed: () {},
            borderRadius: BorderRadius.circular(100),
            backgroundColor: AppColors.kWhiteBase,
            borderColor: AppColors.kBlackBase,
          )
        ],
      ),
    );
  }

  Widget _paymentMethod(BuildContext context) {
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
                    AppLocalizations.of(context)!.creditCard,
                    style: AppTextStyles.font16WeightMedium,
                  ),
                  Radio(value: 1, groupValue: "payment", onChanged: (value) {})
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
