import 'package:flower_app/src/presentation/managers/sign_in/sign_in_actions.dart';
import 'package:flower_app/src/presentation/managers/sign_in/sign_in_states.dart';
import 'package:flower_app/src/presentation/managers/sign_in/sign_in_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/texts/app_text_styles.dart';
import '../../widgets/app_text_field.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    final signInViewModel = context.read<SignInViewModel>();
    IconData visibility = Icons.visibility_off;
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
          BlocBuilder<SignInViewModel,SignInStates>(
            builder: (context, state) {
              if(state is VisiblePasswordState){
                visibility= Icons.visibility;
              }else if (state is NonVisiblePasswordState){
                visibility = Icons.visibility_off;
              }
              return AppTextField(
                controller: signInViewModel.passwordController,
                labelText: AppLocalizations.of(context)!.password,
                hintText: AppLocalizations.of(context)!.enterYourPassword,
                hintStyle: AppTextStyles.font14WeightNormal,
                labelStyle: AppTextStyles.font12WeightNormal,
                suffixIcon: IconButton(
                  onPressed: () {
                    signInViewModel.doAction(ChangePasswordVisibilityAction());
                  },
                  icon: Icon(visibility),
                ),
                obscureText: signInViewModel.isObscureText,
              );
            },
          ),
        ],
      ),
    );
  }
}
