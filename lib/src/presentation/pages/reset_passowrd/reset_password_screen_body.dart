import 'package:flower_app/common/common.dart';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/src/presentation/managers/reset_password/reset_password_actions.dart';
import 'package:flower_app/src/presentation/managers/reset_password/reset_password_states.dart';
import 'package:flower_app/src/presentation/managers/reset_password/reset_password_view_model.dart';
import 'package:flower_app/src/presentation/widgets/app_text_button.dart';
import 'package:flower_app/src/presentation/widgets/app_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreenBody extends StatelessWidget {
  ResetPasswordScreenBody({super.key});
  Color buttonColor = AppColors.kBlack30;
  Color borderColor = AppColors.kBlack30;
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ResetPasswordViewModel>();
    viewModel.setObscure();
    return SingleChildScrollView(
      child: BlocConsumer<ResetPasswordViewModel, ResetPasswordStates>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: viewModel.formKey,
              child: Column(
                children: [
                  verticalSpace(24),
                  AppTextField(
                    labelText: AppLocalizations.of(context)!.currentPassword,
                    hintText: AppLocalizations.of(context)!.currentPassword,
                    hintStyle: AppTextStyles.font14WeightNormal,
                    controller: viewModel.currentPasswordController,
                    suffixIcon: IconButton(
                        onPressed: () {
                          viewModel.doActin(ChangePasswordVisibilityAction(
                              fieldId: PasswordFieldId.currentPassword));
                        },
                        icon: const Icon(Icons.remove_red_eye)),
                    obscureText:
                        viewModel.getIsObscure(PasswordFieldId.currentPassword),
                    onChanged: (value) {
                      viewModel.doActin(ActiveUpdateButtonAction());
                    },
                    validator: (value) {
                      return viewModel.validatePassword(value ?? "");
                    },
                  ),

                  verticalSpace(24),

                  AppTextField(
                    labelText: AppLocalizations.of(context)!.newPassword,
                    hintText: AppLocalizations.of(context)!.newPassword,
                    hintStyle: AppTextStyles.font14WeightNormal,
                    controller: viewModel.newPasswordController,
                    suffixIcon: IconButton(
                        onPressed: () {
                          viewModel.doActin(ChangePasswordVisibilityAction(
                              fieldId: PasswordFieldId.newPassword));
                        },
                        icon: const Icon(Icons.remove_red_eye)),
                    obscureText:
                        viewModel.getIsObscure(PasswordFieldId.newPassword),
                    onChanged: (value) {
                      viewModel.doActin(ActiveUpdateButtonAction());
                    },
                    validator: (value) {
                      return viewModel.validatePassword(value ?? "");
                    },
                  ),

                  verticalSpace(24),

                  AppTextField(
                    labelText: AppLocalizations.of(context)!.confirmPassword,
                    hintText: AppLocalizations.of(context)!.confirmPassword,
                    hintStyle: AppTextStyles.font14WeightNormal,
                    controller: viewModel.confirmPasswordController,
                    suffixIcon: IconButton(
                        onPressed: () {
                          viewModel.doActin(ChangePasswordVisibilityAction(
                              fieldId: PasswordFieldId.confirmPassword));
                        },
                        icon: const Icon(Icons.remove_red_eye)),
                    obscureText:
                        viewModel.getIsObscure(PasswordFieldId.confirmPassword),
                    onChanged: (value) {
                      viewModel.doActin(ActiveUpdateButtonAction());
                    },
                    validator: (value) {
                      return viewModel.validateConfirmPassword(value ?? "");
                    },
                  ),

                  verticalSpace(48),

                  AppTextButton(
                    borderRadius: BorderRadius.circular(100),
                    backgroundColor: buttonColor,
                    borderColor: borderColor,
                    buttonText: AppLocalizations.of(context)!.update,
                    textStyle: AppTextStyles.font16WeightMedium
                        .copyWith(color: AppColors.kWhiteBase),
                    onPressed: () {
                      if (state is ActiveButtonState) {
                        viewModel.doActin(UpdatePasswordAction());
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is ActiveButtonState) {
            buttonColor = AppColors.kBaseColor;
            borderColor = AppColors.kBaseColor;
          } else if (state is DeActiveButtonState) {
            buttonColor = AppColors.kBlack30;
            borderColor = AppColors.kBlack30;
          }
        },
      ),
    );
  }
}
