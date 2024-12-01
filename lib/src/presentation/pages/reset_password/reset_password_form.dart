import 'package:flower_app/config/routes/app_route.dart';
import 'package:flower_app/core/styles/app_radius.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/spaceing.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/managers/reset_password/reset_password_view_action.dart';
import 'package:flower_app/src/presentation/managers/reset_password/reset_password_view_model.dart';
import 'package:flower_app/src/presentation/managers/reset_password/reset_password_view_state.dart';
import 'package:flower_app/src/presentation/widgets/app_text_button.dart';
import 'package:flower_app/src/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<ResetPasswordViewModel>();
    var email = viewModel.email = ModalRoute.of(context)!.settings.arguments as String?;
    String? passwordErrorMessage;
    return Form(
      onChanged: () => viewModel.doAction(FormDataChangedAction()),
      key: viewModel.resetPasswordFormKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: BlocBuilder<ResetPasswordViewModel , ResetPasswordViewState>(
          builder: (context, state) =>  Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.resetPassword,
                    style: AppTextStyles.font20WeightMedium,
                  ),
                ],
              ),
              verticalSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 400,
                    child: Text(
                      textAlign: TextAlign.center,
                      AppLocalizations.of(context)!.passwordMustNotBeEmpty,
                      style: AppTextStyles.font12WeightNormal,
                      maxLines: 5,
                      softWrap: true,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
              verticalSpace(16),
              AppTextField(
                  controller: viewModel.passwordController,
                  labelText: AppLocalizations.of(context)!.password,
                  hintText: AppLocalizations.of(context)!.enterYourPassword,
                  hintStyle: AppTextStyles.font14WeightNormal,
                  labelStyle: AppTextStyles.font12WeightNormal.copyWith(
                      color: passwordErrorMessage != null
                          ? AppColors.error
                          : AppColors.kGray),
                  errorText: passwordErrorMessage,
                  suffixIcon: IconButton(
                    onPressed: () {
                      viewModel.doAction(ChangePasswordVisibilityAction());
                    },
                    icon: const Icon(Icons.visibility_off),
                  ),
                  obscureText: viewModel.isObscureText,
                  validator: (value) {
                    passwordErrorMessage = viewModel.validatePassword();
                    return passwordErrorMessage;
                  }),
              verticalSpace(48),
              AppTextButton(
                borderRadius: const BorderRadius.all(AppRadius.xxl),
                buttonText: AppLocalizations.of(context)!.confirm,
                textStyle: AppTextStyles.font16WeightMedium
                    .copyWith(color: AppColors.kWhiteBase),
                onPressed: () => viewModel.doAction(OnCompleteResetPassword(email ?? "")),
                backgroundColor: AppColors.kBaseColor,
                borderColor: AppColors.kBlack,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
