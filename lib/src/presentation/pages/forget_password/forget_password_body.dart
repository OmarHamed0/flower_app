import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flower_app/flower_app.dart';
import 'package:flower_app/src/presentation/managers/forget_password/forget_password_contract.dart';
import 'package:flower_app/src/presentation/managers/forget_password/forget_password_view_model.dart';
import 'package:flower_app/src/presentation/pages/forget_password/Forget_password_form.dart';
import 'package:flower_app/src/presentation/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordViewModel, ForgetPasswordViewState>(
        listener: (context, state) async {
          if (state is ForgetPasswordLoadingState) {
            LoadingDialog.show(context);
          } else if (state is ForgetPasswordSuccessState) {
            LoadingDialog.hide(context);
            await Future.delayed(const Duration(
                milliseconds: 500)); // Small delay for smooth transition
            SuccessDialog.show(context);

            await Future.delayed(
                const Duration(seconds: 1)); // Wait for the animation
            SuccessDialog.hide(context);

            // Navigate after showing the success dialog
            navKey.currentState?.pushNamedAndRemoveUntil(
              PageRouteName.otpVerify,
              arguments: context.read<ForgetPasswordViewModel>().email,
              (route) => false,
            );
          } else if (state is ForgetPasswordFailState) {
            LoadingDialog.hide(context);
            await Future.delayed(const Duration(milliseconds: 500));
            ErrorDialog.show(context);

            await Future.delayed(
                const Duration(seconds: 2)); // Wait for the error animation
            ErrorDialog.hide(context);
          } else if (state is PopDialogState) {
            LoadingDialog.hide(context);
          }
        },
        builder: (context, state) => const ForgetPasswordForm());
  }
}
