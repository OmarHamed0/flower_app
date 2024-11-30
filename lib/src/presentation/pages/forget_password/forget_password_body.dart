import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flower_app/common/awesome_dialog.dart';
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
            LoadingDialog.show(context);
          } else if (state is ForgetPasswordSuccessState) {
            showAwesomeDialog(
              context,
              title: AppLocalizations.of(context)!.emailSentSuccessfully,
              desc: AppLocalizations.of(context)!.verificationCodeIsSentToYourEmail,
              dialogType: DialogType.success,
              onOk: () => navKey.currentState?.pushNamedAndRemoveUntil(
                PageRouteName.otpVerify,
                arguments: context
                    .read<ForgetPasswordViewModel>()
                    .emailController
                    .text,
                (route) => false,
              ),
            );
          } else if (state is ForgetPasswordFailState) {
            showAwesomeDialog(context,
                title: 'Error',
                desc: state.message,
                onOk: () {},
                dialogType: DialogType.error);
          } else if (state is PopDialogState) {
            LoadingDialog.hide(context);
          }
        },
        builder: (context, state) => const ForgetPasswordForm());
  }
}
