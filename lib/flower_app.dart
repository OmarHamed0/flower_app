import 'dart:developer';
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

  @override
  Widget build(BuildContext context) {
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
        initialRoute: PageRouteName.splash, // Splash screen is the initial route
        onGenerateRoute: AppRoute.onGenerateRoute,
        themeMode: ThemeMode.light,
        // theme: AppTheme.appTheme,
      ),
    );
  }
}