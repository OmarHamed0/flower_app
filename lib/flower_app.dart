import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/routes/app_route.dart';
import 'config/routes/page_route_name.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
class FlowerApp extends StatelessWidget {
  const FlowerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'), // English
          Locale('es'), // Spanish
        ],
        debugShowCheckedModeBanner:  false,
        navigatorKey: navKey,
        initialRoute: PageRouteName.splash,
        onGenerateRoute: AppRoute.onGenerateRoute,
        themeMode:ThemeMode.light,
       // theme: AppTheme.appTheme,
      ),
    );
  }
}