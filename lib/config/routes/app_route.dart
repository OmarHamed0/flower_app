import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flower_app/src/presentation/pages/home/home_screen.dart';
import 'package:flower_app/src/presentation/pages/sign_in/sign_in_screen.dart';
import 'package:flower_app/src/presentation/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import '../../src/presentation/pages/product_details/product_details.dart';

class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.splash:
        return _handelMaterialPageRoute(
            settings: settings,
            widget: const SplashScreen()
        );
      case PageRouteName.signIn:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case PageRouteName.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case PageRouteName.productDetails:
         return _handelMaterialPageRoute(widget: ProductDetails(), settings: settings);
      default:
        return _handelMaterialPageRoute(
            settings: settings,
            widget: const Scaffold()
        );
    }
  }
  static MaterialPageRoute<dynamic> _handelMaterialPageRoute(
      {required Widget widget, required RouteSettings settings}) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}
