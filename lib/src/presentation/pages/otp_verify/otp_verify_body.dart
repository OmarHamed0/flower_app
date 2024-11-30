import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flower_app/common/awesome_dialog.dart';
import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flower_app/flower_app.dart';
import 'package:flower_app/src/presentation/managers/otp_verify/otp_verify_states.dart';
import 'package:flower_app/src/presentation/managers/otp_verify/otp_verify_view_model.dart';
import 'package:flower_app/src/presentation/pages/otp_verify/otp_form.dart';
import 'package:flower_app/src/presentation/widgets/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OtpVerifyBody extends StatelessWidget {
  const OtpVerifyBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<OtpVerifyViewModel>();
    viewModel.email = ModalRoute.of(context)!.settings.arguments as String?;
    return BlocConsumer<OtpVerifyViewModel, OtpVerifyViewState>(
      listener: (context, state) async {
        if (state is OtpVerifyLoadingState) {
          LoadingDialog.show(context);
        } else if (state is OtpSuccessState) {
          showAwesomeDialog(
            context,
            title: AppLocalizations.of(context)!.emailSentSuccessfully,
            desc: "Description",
            dialogType: DialogType.success,
            onOk: () => navKey.currentState?.pushNamedAndRemoveUntil(
              PageRouteName.resetPassword,
              arguments: context.read<OtpVerifyViewModel>().email,
                  (route) => false,
            ),
          );
        } else if (state is OtpFailState) {
          showAwesomeDialog(context,
              title: 'Error',
              desc: state.message,
              onOk: () {},
              dialogType: DialogType.error);
        } else if (state is PopDialogState) {
          LoadingDialog.hide(context);
          LoadingDialog.hide(context);
        }
      },
      builder: (context, state) => OtpForm(),
    );
  }
}
