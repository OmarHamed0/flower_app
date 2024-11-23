import 'package:flower_app/src/presentation/managers/home/home_viewmodel.dart';
import 'package:flower_app/src/presentation/widgets/home/app_bar/custom_appbar_home.dart';
import 'package:flower_app/src/presentation/widgets/home/app_bar/location_widget.dart';
import 'package:flower_app/src/presentation/widgets/home/view_all_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../dependency_injection/di.dart';
import '../../managers/home/home_actions.dart';
import '../../widgets/home/best_seller/best_seller_row.dart';
import '../../widgets/home/category/category_row.dart';
import '../../widgets/home/occasion/occasions_row.dart';
import '../../widgets/home/products/products_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = getIt<HomeViewModel>();

    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => homeViewModel..doAction(LoadHomeDataAction()),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppbarHome(),
                  SizedBox(height: 16),
                  LocationWidget(),
                  SizedBox(height: 24),
                  ProductsWidget(),
                  SizedBox(height: 24),
                  ViewAllRow(
                    title: AppLocalizations.of(context)!.categories,
                  ),
                  SizedBox(height: 16),
                  CategoryRow(),
                  SizedBox(height: 24),
                  ViewAllRow(
                    title: AppLocalizations.of(context)!.best_Seller,
                  ),
                  SizedBox(height: 16),
                  BestSellerRow(),
                  SizedBox(height: 24),
                  ViewAllRow(title: AppLocalizations.of(context)!.occasions),
                  SizedBox(height: 16),
                  OccasionsRow(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
