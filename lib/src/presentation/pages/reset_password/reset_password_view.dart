import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/managers/reset_password/reset_password_view_model.dart';
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
    );
  }
}
