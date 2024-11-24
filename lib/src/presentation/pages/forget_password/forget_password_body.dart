import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flower_app/common/awesome_dialoge.dart';
import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flower_app/flower_app.dart';
import 'package:flower_app/src/presentation/managers/forget_password/forget_password_contract.dart';
import 'package:flower_app/src/presentation/managers/forget_password/forget_password_view_model.dart';
import 'package:flower_app/src/presentation/pages/forget_password/Forget_password_form.dart';
import 'package:flower_app/src/presentation/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordViewModel, ForgetPasswordViewState>(
        listener: (context, state) {
          if (state is ForgetPasswordLoadingState) {
            print("in loading state");
            showAwesomeDialog(
              context,
              title: AppLocalizations.of(context)!.emailSentSuccessfully,
              desc: "Loading",
              dialogType: DialogType.question,
              onOk: () => navKey.currentState?.pushNamedAndRemoveUntil(
                PageRouteName.otpVerify,
                arguments: context.read<ForgetPasswordViewModel>().emailController.text,
                    (route) => false,
              ),
            );
          } else
          if (state is ForgetPasswordSuccessState) {
            print("in success state"); // Small delay for smooth transition
            showAwesomeDialog(
              context,
              title: AppLocalizations.of(context)!.emailSentSuccessfully,
              desc: "Description",
              dialogType: DialogType.success,
              onOk: () => navKey.currentState?.pushNamedAndRemoveUntil(
                PageRouteName.otpVerify,
                arguments: context.read<ForgetPasswordViewModel>().emailController.text,
                    (route) => false,
              ),
            );
            SuccessDialog.show(context);

             // Wait for the animation
            SuccessDialog.hide(context);

            // Navigate after showing the success dialog

          } else if (state is ForgetPasswordFailState) {
            print("in fail state");
            LoadingDialog.hide(context);
            ErrorDialog.show(context); // Wait for the error animation
            ErrorDialog.hide(context);
          } else if (state is PopDialogState) {
            LoadingDialog.hide(context);
          }
        },
        builder: (context, state) => const ForgetPasswordForm());
  }
}
