import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flower_app/flower_app.dart';
import 'package:flower_app/src/presentation/managers/otp_verify/otp_verify_states.dart';
import 'package:flower_app/src/presentation/managers/otp_verify/otp_verify_view_model.dart';
import 'package:flower_app/src/presentation/pages/otp_verify/otp_form.dart';
import 'package:flower_app/src/presentation/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpVerifyBody extends StatelessWidget {
  const OtpVerifyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpVerifyViewModel, OtpVerifyViewState>(
      listener: (context, state) async {
        if (state is OtpVerifyLoadingState) {
          LoadingDialog.show(context);
        } else if (state is OtpSuccessState) {
          LoadingDialog.hide(context);
          await Future.delayed(const Duration(
              milliseconds: 500)); // Small delay for smooth transition
          SuccessDialog.show(context);

          await Future.delayed(
              const Duration(seconds: 10)); // Wait for the animation
          SuccessDialog.hide(context);
          // Navigate after showing the success dialog
          navKey.currentState?.pushNamedAndRemoveUntil(
            PageRouteName.signIn,
            (route) => false,
          );
        } else if (state is OtpFailState) {
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
      builder: (context, state) => OtpForm(),
    );
  }
}
