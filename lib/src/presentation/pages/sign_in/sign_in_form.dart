import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/spaceing.dart';
import 'package:flower_app/src/presentation/managers/sign_in/sign_in_actions.dart';
import 'package:flower_app/src/presentation/managers/sign_in/sign_in_states.dart';
import 'package:flower_app/src/presentation/managers/sign_in/sign_in_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/styles/texts/app_text_styles.dart';
import '../../widgets/app_text_field.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final signInViewModel = context.read<SignInViewModel>();
    IconData visibility = Icons.visibility_off;
    String? emailErrorMessage;
    String? passwordErrorMessage;
    return Form(
      key: signInViewModel.signInFormKey,
      child: Column(
        children: [
          BlocBuilder<SignInViewModel, SignInStates>(
            builder: (context,state){
             return AppTextField(
                controller: signInViewModel.emailController,
                labelText: AppLocalizations.of(context)!.email,
                hintText: AppLocalizations.of(context)!.enterYourEmail,
                labelStyle: AppTextStyles.font12WeightNormal.copyWith(
                    color: emailErrorMessage != null
                        ? AppColors.kError
                        : AppColors.kGray),
                hintStyle: AppTextStyles.font14WeightNormal,
                errorText: emailErrorMessage,
                validator: (value) {
                  emailErrorMessage = signInViewModel.validateEmail();
                  return emailErrorMessage;
                },
              );
            },
          ),
          verticalSpace(14),
          BlocBuilder<SignInViewModel, SignInStates>(
            builder: (context, state) {
              if (state is VisiblePasswordState) {
                visibility = Icons.visibility;
              } else if (state is NonVisiblePasswordState) {
                visibility = Icons.visibility_off;
              }
              return AppTextField(
                  controller: signInViewModel.passwordController,
                  labelText: AppLocalizations.of(context)!.password,
                  hintText: AppLocalizations.of(context)!.enterYourPassword,
                  hintStyle: AppTextStyles.font14WeightNormal,
                  labelStyle: AppTextStyles.font12WeightNormal.copyWith(
                      color: passwordErrorMessage != null
                          ? AppColors.kError
                          : AppColors.kGray),
                  errorText: passwordErrorMessage,
                  suffixIcon: IconButton(
                    onPressed: () {
                      signInViewModel
                          .doAction(ChangePasswordVisibilityAction());
                    },
                    icon: Icon(visibility),
                  ),
                  obscureText: signInViewModel.isObscureText,
                  validator: (value) {
                    passwordErrorMessage = signInViewModel.validatePassword();
                    return passwordErrorMessage;
                  });
            },
          ),
        ],
      ),
    );
  }
}
