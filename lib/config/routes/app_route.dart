import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/auth/signup/manager/signup_viewmodel.dart';
import 'package:flower_app/src/presentation/auth/signup/views/sign_up_view.dart';
import 'package:flower_app/src/presentation/managers/home/home_viewmodel.dart';
import 'package:flower_app/src/presentation/pages/home/home_screen.dart';
import 'package:flower_app/src/presentation/pages/product/view/product_view.dart';
import 'package:flower_app/src/presentation/pages/sign_in/sign_in_screen.dart';
import 'package:flower_app/src/presentation/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../src/presentation/pages/base_screen/base_screen.dart';
import '../../src/presentation/pages/product_details/product_details.dart';

class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.splash:
        return _handelMaterialPageRoute(
            settings: settings, widget: const SplashScreen());
      case PageRouteName.signup:
        return _handelMaterialPageRoute(
          settings: settings,
          widget: BlocProvider(
            create: (context) => getIt<SignUpViewModel>(),
            child: const SignUpView(),
          ),
        );

      case PageRouteName.signIn:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case PageRouteName.home:
        return _handelMaterialPageRoute(
          settings: settings,
          widget: BlocProvider(
            create: (context) => getIt<HomeViewModel>(),
            child: const HomeScreen(),
          ),
        );
      case PageRouteName.splash:
        return _handelMaterialPageRoute(
          settings: settings,
          widget: SplashScreen(),
        );
      case PageRouteName.productDetails:
        return _handelMaterialPageRoute(
            settings: settings,
            widget: ProductDetails(
              productId: "",
            ));
      case PageRouteName.product:
        return _handelMaterialPageRoute(
            settings: settings, widget: ProductView());
      case PageRouteName.baseScreen:
        return _handelMaterialPageRoute(
            settings: settings,
            widget: BlocProvider(
              create: (context) => getIt<HomeViewModel>(),
              child: const BaseScreen(),
            ));
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
