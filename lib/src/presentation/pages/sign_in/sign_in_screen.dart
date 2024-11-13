import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/managers/sign_in/sign_in_view_model.dart';
import 'package:flower_app/src/presentation/pages/sign_in/sign_in_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final signInViewModel = getIt.get<SignInViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> signInViewModel,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(),
          body: const SignInScreenBody(),
        ),
      ),
    );
  }
}
