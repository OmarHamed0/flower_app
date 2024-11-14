import 'package:flower_app/src/presentation/managers/sign_in/sign_in_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/texts/app_text_styles.dart';
import '../../widgets/app_text_field.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final signInViewModel = context.read<SignInViewModel>();
    return Form(
      child: Column(
        children: [
          AppTextField(
            controller: signInViewModel.emailController,
            labelText: AppLocalizations.of(context)!.email,
            hintText: AppLocalizations.of(context)!.enterYourEmail,
            labelStyle: AppTextStyles.font12WeightNormal,
            hintStyle: AppTextStyles.font14WeightNormal,
          ),
          SizedBox(
            height: 14.h,
          ),
          AppTextField(
            controller: signInViewModel.passwordController,
            labelText: AppLocalizations.of(context)!.password,
            hintText: AppLocalizations.of(context)!.enterYourPassword,
            hintStyle: AppTextStyles.font14WeightNormal,
            labelStyle: AppTextStyles.font12WeightNormal,
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
