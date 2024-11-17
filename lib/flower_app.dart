import 'dart:developer';

import 'package:flower_app/config/helpers/shared_pre_keys.dart';
import 'package:flower_app/config/helpers/shared_pref_helper.dart';
import 'package:flower_app/config/localization/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'config/routes/app_route.dart';
import 'config/routes/page_route_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class FlowerApp extends StatelessWidget {
  const FlowerApp({super.key});

  Future<void> _navigateBasedOnToken() async {
    // Fetch the user token from secure storage
    final userToken = await SharedPrefHelper.getSecureString(SharedPrefKeys.userToken);
    log("User token: $userToken");

    // Navigate based on token
    final initialRoute = (userToken != null && userToken.isNotEmpty)
        ? PageRouteName.home
        : PageRouteName.signIn;

    navKey.currentState?.pushReplacementNamed(initialRoute);
  }

  @override
  Widget build(BuildContext context) {
    // Start the navigation process
    WidgetsBinding.instance.addPostFrameCallback((_) => _navigateBasedOnToken());

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: L10n.all,
        debugShowCheckedModeBanner: false,
        locale: const Locale('en'),
        navigatorKey: navKey,
        initialRoute: PageRouteName.splash, // Temporary splash screen
        onGenerateRoute: AppRoute.onGenerateRoute,
        themeMode: ThemeMode.light,
        // theme: AppTheme.appTheme,
      ),
    );
  }
}
