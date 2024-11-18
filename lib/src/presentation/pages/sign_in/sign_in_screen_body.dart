import 'package:animate_do/animate_do.dart';
import 'package:flower_app/core/styles/spaceing.dart';
import 'package:flower_app/src/presentation/managers/sign_in/sign_in_states.dart';
import 'package:flower_app/src/presentation/managers/sign_in/sign_in_view_model.dart';
import 'package:flower_app/src/presentation/pages/sign_in/remember_me_forget_password_row.dart';
import 'package:flower_app/src/presentation/pages/sign_in/sign_in_form.dart';
import 'package:flower_app/src/presentation/pages/sign_in/sign_in_screen_buttons.dart';
import 'package:flower_app/src/presentation/widgets/app_toast.dart';
import 'package:flower_app/src/presentation/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'donot_have_account.dart';

class SignInScreenBody extends StatelessWidget {
  const SignInScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final signInViewModel = context.read<SignInViewModel>();
    return BlocConsumer<SignInViewModel, SignInStates>(
      listener: (context, state) {
        if (state is SignInLoadingState) {
          LoadingDialog.show(context);
        } else if (state is SignInSuccessState) {
          Future.delayed(const Duration(milliseconds: 1500), () {
            SuccessDialog.hide(context);
            navKey.currentState?.pushNamedAndRemoveUntil(
              PageRouteName.home,
              (route) => false,
            );
          });
          SuccessDialog.show(context);
        } else if (state is SignInFailedState) {
          Future.delayed(const Duration(seconds: 2), () {
            ErrorDialog.hide(context);
          });
          ErrorDialog.show(context);
          showToast(state.message!);
        } else if (state is PopDialogState) {
          LoadingDialog.hide(context);
          LoadingDialog.hide(context);
          showAwesomeDialog(context,
              title: 'Success', desc: 'You Signed in successfully', onOk: () {
            navKey.currentState!
                .pushNamedAndRemoveUntil(PageRouteName.home, (route) => false);
          }, dialogType: DialogType.success);
          showAwesomeDialog(context,
              title: 'Error',
              desc: state.message!,
              onOk: () {},
              dialogType: DialogType.error);
          LoadingDialog.hide(context);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: Column(
                children: [
                  FadeInDown(
                    duration: const Duration(milliseconds: 1900),
                    child: const SignInForm(),
                  ),
                  verticalSpace(15),
                  FadeInDown(
                    duration: const Duration(milliseconds: 2000),
                    child: const RememberMeForgetPasswordRow(),
                  ),
                  verticalSpace(48),
                  FadeInDown(
                    duration: const Duration(milliseconds: 2100),
                    child: const SignInScreenButtons(),
                  ),
                  verticalSpace(16),
                  FadeInDown(
                    duration: const Duration(milliseconds: 2200),
                    child: const DonotHaveAccount(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
