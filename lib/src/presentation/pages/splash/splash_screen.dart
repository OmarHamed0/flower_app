import 'dart:async';

import 'package:flower_app/config/helpers/shared_pre_keys.dart';
import 'package:flower_app/config/helpers/shared_pref_helper.dart';
import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flower_app/core/animations/app_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:flower_app/config/helpers/shared_pre_keys.dart';
import 'package:flower_app/config/helpers/shared_pref_helper.dart';
import 'package:flower_app/config/routes/page_route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateBasedOnToken();
  }

  Future<void> _navigateBasedOnToken() async {
    await Future.delayed(const Duration(seconds: 4));

    final userToken =
    await SharedPrefHelper.getSecureString(SharedPrefKeys.userToken);


    final nextRoute = (userToken != null && userToken.isNotEmpty)
        ? PageRouteName.home
        : PageRouteName.signIn;

    Navigator.pushReplacementNamed(context, nextRoute);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Lottie.asset(
            AppAnimations.loading,
            width: 300.w,
            height: 300.h,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
