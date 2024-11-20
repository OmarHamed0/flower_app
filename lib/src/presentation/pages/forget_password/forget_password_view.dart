import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/managers/forget_password/forget_password_view_model.dart';
import 'package:flower_app/src/presentation/pages/forget_password/forget_password_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final viewModel = getIt.get<ForgetPasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        backgroundColor: AppColors.kWhiteBase,
        appBar: AppBar(
            leading: const Icon(Icons.arrow_back_ios_new),
            title: Text(
              AppLocalizations.of(context)!.password,
              style: AppTextStyles.font20WeightMedium,
            )),
        body: const ForgetPasswordBody(),
      ),
    );
  }
}
