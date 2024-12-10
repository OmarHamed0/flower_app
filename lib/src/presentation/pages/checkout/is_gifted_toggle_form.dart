import 'package:animate_do/animate_do.dart';
import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_actions.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_states.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_view_model.dart';
import 'package:flower_app/src/presentation/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IsGiftedToggleForm extends StatelessWidget {
  const IsGiftedToggleForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CheckoutViewModel>();
    bool isSwitched = viewModel.isSwitched;
    return  BlocBuilder<CheckoutViewModel, CheckOutStates>(
      builder: (context, stata) {
        if (stata is SwitchToggleState) {
          isSwitched = stata.isSwitched;
        }
        if (isSwitched == true) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            viewModel.scrollController.animateTo(
              viewModel
                  .scrollController.position.maxScrollExtent,
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
                    AppLocalizations.of(context)!.itsGift,
                    style: AppTextStyles.font18BlackMedium,
                  )
                ],
              ),
              FadeInLeft(
                child: AppTextField(
                  controller: viewModel.nameController,
                  onSaved: (value) {
                    viewModel.validateName(value);
                  },
                  labelText:
                  AppLocalizations.of(context)!.name,
                  hintText: AppLocalizations.of(context)!
                      .enterYourName,
                  hintStyle: AppTextStyles.font14WeightNormal
                      .copyWith(color: AppColors.kWhite70),
                  keyboardType: TextInputType.text,
                ),
              ),
              verticalSpace(8),
              FadeInLeft(
                child: AppTextField(
                  controller: viewModel.phoneController,
                  keyboardType: TextInputType.phone,
                  onSaved: (value) {
                    viewModel.validatePhone(value);
                  },
                  labelText: AppLocalizations.of(context)!
                      .phoneNumber,
                  hintText: AppLocalizations.of(context)!
                      .enterYourPhoneNumber,
                  hintStyle: AppTextStyles.font14WeightNormal
                      .copyWith(color: AppColors.kWhite70),
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
            Text(AppLocalizations.of(context)!.itsGift,
                style: AppTextStyles.font18BlackMedium)
          ],
        );
      },
    );
  }
}
