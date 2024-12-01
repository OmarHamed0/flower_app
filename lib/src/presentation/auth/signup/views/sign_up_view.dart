import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/widgets/app_button.dart';
import 'package:flower_app/core/widgets/title_of_view.dart';
import 'package:flower_app/src/presentation/auth/signup/manager/signup_states.dart';
import 'package:flower_app/src/presentation/auth/signup/manager/signup_viewmodel.dart';
import 'package:flower_app/src/presentation/auth/signup/views/SignUpModelViewListener.dart';
import 'package:flower_app/src/presentation/auth/signup/widgets/login_text.dart';
import 'package:flower_app/src/presentation/auth/signup/widgets/sign_up_form.dart';
import 'package:flower_app/src/presentation/auth/signup/widgets/therms_and_condition_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TitleOfView(title: "signup"),
                const SignUpForm(),
                const TermsAndConditionsText(),
                verticalSpace(50),
                BlocBuilder<SignUpViewModel, SignupViewState>(
                  buildWhen: (previous, current) =>
                      current is SignupValidationButtonState,
                  builder: (context, state) {
                    return AppButton(
                      isExpanded: true,
                      text: "Sign Up",
                      onPressed: () {
                        context.read<SignUpViewModel>().validateThenDoSignup();
                      },
                    );
                  },
                ),
                const LoginText(),
                const SignUpModelViewListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
