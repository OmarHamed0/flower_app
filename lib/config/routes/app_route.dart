import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/auth/signup/manager/signup_viewmodel.dart';
import 'package:flower_app/src/presentation/auth/signup/views/sign_up_view.dart';
import 'package:flower_app/src/presentation/managers/categories/categories_action.dart';
import 'package:flower_app/src/presentation/managers/categories/categories_view_model.dart';
import 'package:flower_app/src/presentation/managers/home/home_viewmodel.dart';
import 'package:flower_app/src/presentation/managers/product/core/product_core.dart';
import 'package:flower_app/src/presentation/managers/product/product_event.dart';
import 'package:flower_app/src/presentation/pages/about_app/about_app_view.dart';
import 'package:flower_app/src/presentation/pages/address/add_address_screen.dart';
import 'package:flower_app/src/presentation/pages/address/saved_address_screen.dart';
import 'package:flower_app/src/presentation/pages/best_seller/best_seller_screen.dart';
import 'package:flower_app/src/presentation/pages/checkout/checkout_screen.dart';
import 'package:flower_app/src/presentation/pages/home/home_screen.dart';
import 'package:flower_app/src/presentation/pages/notifications/notifications_screen.dart';
import 'package:flower_app/src/presentation/pages/occasion/occasion_screen.dart';
import 'package:flower_app/src/presentation/pages/product/view/product_view.dart';
import 'package:flower_app/src/presentation/pages/reset_passowrd/reset_password_screen.dart';
import 'package:flower_app/src/presentation/pages/sign_in/sign_in_screen.dart';
import 'package:flower_app/src/presentation/pages/splash/splash_screen.dart';
import 'package:flower_app/src/presentation/pages/terms_and_conditions/terms_and_conditions_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../src/presentation/managers/product/product_cubit.dart';
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
      case PageRouteName.besetSellerScreen:
        return _handelMaterialPageRoute(
            settings: settings,
            widget: BlocProvider(
                create: (context) => getIt<ProductCubit>()
                  ..doAction(GetProductEvent(
                      productQueryParameters: ProductQueryParameters(
                          productEndPoints: ProductEndPoints.besetSeller))),
                child: const BestSellerScreen()));

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
      case PageRouteName.productDetails:
        return _handelMaterialPageRoute(
            settings: settings,
            widget: ProductDetails(
              productId: "",
            ));

      case PageRouteName.savedAddress:
        return _handelMaterialPageRoute(
            settings: settings, widget: SavedAddressScreen());
      case PageRouteName.addAddress:
        return _handelMaterialPageRoute(
            settings: settings, widget: AddAddressScreen());
      case PageRouteName.product:
        return _handelMaterialPageRoute(
            settings: settings, widget: const ProductView());
      case PageRouteName.baseScreen:
        return _handelMaterialPageRoute(
            settings: settings,
            widget: MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => getIt<HomeViewModel>()),
                BlocProvider(
                  create: (context) => getIt<CategoriesViewModel>()
                    ..doAction(GetCategoriesAction()),
                ),
                BlocProvider(create: (context) => getIt<ProductCubit>()),
              ],
              child: const BaseScreen(),
            ));
      case PageRouteName.occasions:
        return _handelMaterialPageRoute(
            settings: settings, widget: OccasionScreen());
      case PageRouteName.resetPassword:
        return _handelMaterialPageRoute(
            settings: settings, widget: ResetPasswordScreen());
      case PageRouteName.aboutApp:
        return _handelMaterialPageRoute(
            settings: settings, widget: const AboutAppView());
      case PageRouteName.termsAndConditions:
        return _handelMaterialPageRoute(
            settings: settings, widget: const TermsAndConditionsView());
      case PageRouteName.checkout:
        return _handelMaterialPageRoute(
            settings: settings, widget: CheckoutScreen());
      case PageRouteName.notifications:
        return _handelMaterialPageRoute(
            settings: settings, widget:  NotificationsScreen());
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
