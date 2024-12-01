import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/managers/sign_in/sign_in_view_model.dart';
import 'package:flower_app/src/presentation/pages/sign_in/sign_in_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final signInViewModel = getIt.get<SignInViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> signInViewModel,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.kWhiteBase,
          appBar: AppBar(
            leading: const Icon(Icons.arrow_back_ios_new),
            title: Text(AppLocalizations.of(context)!.login ,style: AppTextStyles.font20WeightMedium,)
          ),
          body: const SignInScreenBody(),
        ),
      ),
    );
  }
}
