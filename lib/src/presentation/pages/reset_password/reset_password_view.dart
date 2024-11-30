import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flower_app/common/awesome_dialog.dart';
import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flower_app/core/dialogs/app_dialogs.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/flower_app.dart';
import 'package:flower_app/src/presentation/managers/reset_password/reset_password_view_model.dart';
import 'package:flower_app/src/presentation/managers/reset_password/reset_password_view_state.dart';
import 'package:flower_app/src/presentation/pages/reset_password/reset_password_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  var viewModel = getIt.get<ResetPasswordViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => viewModel,
      child: BlocListener<ResetPasswordViewModel , ResetPasswordViewState>(
        listener: (context, state) {
          if (state is ResetPasswordLoadingState) {
            LoadingDialog.show(context);
          } else if (state is ResetPasswordSuccessState) {
            showAwesomeDialog(
              context,
              title: AppLocalizations.of(context)!.emailSentSuccessfully,
              desc: "Description",
              dialogType: DialogType.success,
              onOk: () => navKey.currentState?.pushNamedAndRemoveUntil(
                PageRouteName.signIn,
                    (route) => false,
              ),
            );
          } else if (state is ResetPasswordFailedState) {
            showAwesomeDialog(context,
                title: 'Error',
                desc: "Description",
                onOk: () {},
                dialogType: DialogType.error);
          } else if (state is PopDialogState) {
            LoadingDialog.hide(context);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.kWhiteBase,
          appBar: AppBar(
              leading: const Icon(Icons.arrow_back_ios_new),
              title: Text(
                AppLocalizations.of(context)!.password,
                style: AppTextStyles.font20WeightMedium,
              )),
          body: const ResetPasswordForm(),
        ),
      ),
    );
  }
}
