import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/fonts/app_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginText extends StatelessWidget {
  const LoginText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: RichText(
        text: TextSpan(
          text: "Already have an account? ",
          style: AppFonts.font16BlackBase400Weight,
          children: [
            TextSpan(
              text: 'Log in',
              style: AppFonts.font16MainColor500Weight.copyWith(
                decoration: TextDecoration.underline
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                },
            ),
          ],
        ),
      ),
    );
  }
}
