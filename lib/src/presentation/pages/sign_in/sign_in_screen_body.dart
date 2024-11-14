import 'package:flower_app/src/presentation/managers/sign_in/sign_in_view_model.dart';
import 'package:flower_app/src/presentation/pages/sign_in/remember_me_forget_password_row.dart';
import 'package:flower_app/src/presentation/pages/sign_in/sign_in_form.dart';
import 'package:flower_app/src/presentation/pages/sign_in/sign_in_screen_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'donot_have_account.dart';


class SignInScreenBody extends StatelessWidget {
  const SignInScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final signInViewModel = context.read<SignInViewModel>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Column(
            children: [
              const SignInForm(),
              SizedBox(
                height: 15.h,
              ),
              const RememberMeForgetPasswordRow(),
              SizedBox(
                height: 48.h,
              ),
              const SignInScreenButtons(),
              SizedBox(height: 16.h,),
              const DonotHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
