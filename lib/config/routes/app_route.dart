import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/auth/signup/manager/signup_viewmodel.dart';
import 'package:flower_app/src/presentation/auth/signup/views/sign_up_view.dart';
import 'package:flower_app/src/presentation/pages/forget_password/forget_password_view.dart';
import 'package:flower_app/src/presentation/pages/home/home_screen.dart';
import 'package:flower_app/src/presentation/pages/otp_verify/otp_verify_view.dart';
import 'package:flower_app/src/presentation/pages/reset_password/reset_password_view.dart';
import 'package:flower_app/src/presentation/pages/sign_in/sign_in_screen.dart';
import 'package:flower_app/src/presentation/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  static Route<MaterialPageRoute> onGenerateRoute(RouteSettings settings) {
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
          widget: const HomeScreen(),
        );
      case PageRouteName.splash:
        return _handleMaterialPageRoute(
            settings: settings, widget: const SplashScreen());
      case PageRouteName.forgetPassword:
        return _handleMaterialPageRoute(
            widget: const ForgetPasswordView(), settings: settings);
      case PageRouteName.otpVerify:
        return _handleMaterialPageRoute(
            widget: const OtpVerifyView(), settings: settings);
      case PageRouteName.resetPassword:
        return _handleMaterialPageRoute(
            widget: const ResetPasswordView(), settings: settings);
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

  static MaterialPageRoute<MaterialPageRoute> _handleMaterialPageRoute({
    required Widget widget,
    required RouteSettings settings,
  }) {
    return MaterialPageRoute(builder: (_) => widget, settings: settings);
  }
}
