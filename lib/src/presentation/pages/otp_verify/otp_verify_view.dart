import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/managers/otp_verify/otp_verify_view_model.dart';
import 'package:flower_app/src/presentation/pages/otp_verify/otp_verify_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OtpVerifyView extends StatefulWidget {
  const OtpVerifyView({super.key});

  @override
  State<OtpVerifyView> createState() => _OtpVerifyViewState();
}

class _OtpVerifyViewState extends State<OtpVerifyView> {
  final viewModel = getIt.get<OtpVerifyViewModel>();

  @override
  Widget build(BuildContext context) {
    final String? email = ModalRoute.of(context)!.settings.arguments as String?;
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
        body: const OtpVerifyBody(),
      ),
    );
  }
}
