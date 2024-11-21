import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/auth/signup/manager/signup_viewmodel.dart';
import 'package:flower_app/src/presentation/auth/signup/views/sign_up_view.dart';
import 'package:flower_app/src/presentation/managers/home/home_viewmodel.dart';
import 'package:flower_app/src/presentation/pages/home/home_screen.dart';
import 'package:flower_app/src/presentation/pages/sign_in/sign_in_screen.dart';
import 'package:flower_app/src/presentation/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.signup:
        return _handleMaterialPageRoute(
          settings: settings,
          widget: BlocProvider(
            create: (context) => getIt<SignUpViewModel>(),
            child: const SignUpView(),
          ),
        );

      case PageRouteName.signIn:
        return _handleMaterialPageRoute(
          settings: settings,
          widget: SignInScreen(),
        );

      case PageRouteName.home:
        return _handleMaterialPageRoute(
          settings: settings,
          widget: BlocProvider(
            create: (context) => getIt<HomeViewModel>(),
            child: const HomeScreen(),
          ),
        );
      case PageRouteName.splash:
        return _handleMaterialPageRoute(
          settings: settings,
          widget: SplashScreen(),
        );

      default:
        return _handleMaterialPageRoute(
          settings: settings,
          widget: const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
    }
  }

  static MaterialPageRoute<dynamic> _handleMaterialPageRoute({
    required Widget widget,
    required RouteSettings settings,
  }) {
    return MaterialPageRoute(builder: (_) => widget, settings: settings);
  }
}
