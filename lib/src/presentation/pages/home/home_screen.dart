import 'package:flutter/material.dart';

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
