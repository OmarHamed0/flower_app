import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteName.splash:
        return _handelMaterialPageRoute(
            settings: settings,
            widget: const Scaffold()
        );

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
