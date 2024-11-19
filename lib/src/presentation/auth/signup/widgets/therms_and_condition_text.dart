import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/fonts/app_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: 'Creating an account, you agree to our ',
          style: AppFonts.font12BlackBase400Weight,
          children: [
            TextSpan(
              text: 'Terms & Conditions',
              style:AppFonts.font12BlackBase600Weight.copyWith(
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
