import 'package:flower_app/src/presentation/managers/sign_in/sign_in_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreenBody extends StatelessWidget {
  const SignInScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final signInViewModel = context.read<SignInViewModel>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: const SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
