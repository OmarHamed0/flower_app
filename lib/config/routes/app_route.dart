import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flower_app/src/presentation/pages/sign_in/sign_in_screen.dart';
import 'package:flower_app/src/presentation/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependency_injection/di.dart';
import '../../src/presentation/auth/signup/manager/signup_viewmodel.dart';
import '../../src/presentation/auth/signup/views/sign_up_view.dart';

class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.splash:
        return _handelMaterialPageRoute(
            settings: settings, widget: const SplashScreen());
      case PageRouteName.signIn:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case PageRouteName.signup:
        return _handelMaterialPageRoute(
          settings: settings,
          widget: BlocProvider(
              create: (context) => getIt<SignUpViewModel>(),
              child: const SignUpView()),
        );
      default:
        return _handelMaterialPageRoute(
            settings: settings, widget: const Scaffold());
    }
  }

  static MaterialPageRoute<dynamic> _handelMaterialPageRoute(
      {required Widget widget, required RouteSettings settings}) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}
