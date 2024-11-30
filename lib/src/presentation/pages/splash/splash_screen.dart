import 'package:flower_app/core/animations/app_animation.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/managers/splash/splash_actions.dart';
import 'package:flower_app/src/presentation/managers/splash/splash_states.dart';
import 'package:flower_app/src/presentation/managers/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final viewModel = getIt.get<SplashViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel..doAction(GetNextRouteAction()),
      child: Scaffold(
        body: BlocListener<SplashViewModel, SplashStates>(
          listener: (context, state) {
            if (state is NavigateToNextScreen) {
              Navigator.pushReplacementNamed(context, state.nextRoute);
            }
          },
          child: Center(
            child: Lottie.asset(
              AppAnimations.loading,
              width: 300.w,
              height: 300.h,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
