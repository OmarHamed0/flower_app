import 'package:bloc/bloc.dart';
import 'package:flower_app/core/styles/app_radius.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/spaceing.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/managers/forget_password/forget_password_contract.dart';
import 'package:flower_app/src/presentation/managers/forget_password/forget_password_view_model.dart';
import 'package:flower_app/src/presentation/widgets/app_text_button.dart';
import 'package:flower_app/src/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ForgetPasswordViewModel>();
    String? emailErrorMessage;
    return Form(
      onChanged: () => viewModel.doIntent(FormDataChangedAction()),
      key: viewModel.forgetPasswordFormKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: BlocBuilder<ForgetPasswordViewModel , ForgetPasswordViewState>(
          builder: (context, state) => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.forgetPassword,
                    style: AppTextStyles.font20WeightMedium,
                  ),
                ],
              ),
              verticalSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!
                        .pleaseEnterYourEmailAssociatedToYourAccount,
                    style: AppTextStyles.font12WeightNormal,
                  ),
                ],
              ),
              verticalSpace(16),
              AppTextField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: viewModel.emailController,
                labelText: AppLocalizations.of(context)!.email,
                hintText: AppLocalizations.of(context)!.enterYourEmail,
                labelStyle: AppTextStyles.font12WeightNormal.copyWith(
                    color: emailErrorMessage != null
                        ? AppColors.kError
                        : AppColors.kGray),
                hintStyle: AppTextStyles.font14WeightNormal,
                errorText: emailErrorMessage,
                onSaved: (value) {
                  emailErrorMessage = viewModel.validateEmail();
                },
                validator: (value) {
                  emailErrorMessage = viewModel.validateEmail();
                  return emailErrorMessage;
                },
              ),
              verticalSpace(48),
              AppTextButton(
                borderRadius: const BorderRadius.all(AppRadius.xxl),
                buttonText: AppLocalizations.of(context)!.confirm,
                textStyle: AppTextStyles.font16WeightMedium
                    .copyWith(color: AppColors.kWhiteBase),
                backgroundColor: AppColors.kBaseColor,
                onPressed: () => viewModel.doIntent(ForgetPasswordAction()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
