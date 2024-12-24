import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/managers/cart/cart_view_model.dart';
import 'package:flower_app/src/presentation/managers/localization/localization_cubit.dart';
import 'package:flower_app/src/presentation/managers/product/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/localization/l10n.dart';
import 'config/routes/app_route.dart';
import 'config/routes/page_route_name.dart';
import 'config/theme/app_theme.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class FlowerApp extends StatelessWidget {
  const FlowerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<CartViewModel>(),
        ),
        BlocProvider(
            create: (context) => LocalizationCubit()..getSavedLanguage()),
        BlocProvider(create: (context) => getIt<ProductCubit>()),

      ],
      child: BlocBuilder<LocalizationCubit, LocalizationState>(
        builder: (context, state) {
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
              locale: Locale(BlocProvider.of<LocalizationCubit>(context)
                  .cachedLanguageCode),
              navigatorKey: navKey,
              initialRoute: PageRouteName.splash,
              onGenerateRoute: AppRoute.onGenerateRoute,
              themeMode: ThemeMode.light,
              theme: AppTheme.defaultTheme,
              // theme: AppTheme.appTheme,
            ),
          );
        },
      ),
    );
  }
}
