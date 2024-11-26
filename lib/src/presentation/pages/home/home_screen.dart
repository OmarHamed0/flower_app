import 'package:flower_app/flower_app.dart';
import 'package:flower_app/src/presentation/managers/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';

import '../../../../config/routes/page_route_name.dart';
import '../../../../core/styles/images/app_images.dart';
import '../../../../dependency_injection/di.dart';
import '../../managers/home/home_actions.dart';
import '../../managers/home/home_viewmodel.dart';
import '../../widgets/home/app_bar/custom_appbar_home.dart';
import '../../widgets/home/app_bar/location_widget.dart';
import '../../widgets/home/best_seller/best_seller_row.dart';
import '../../widgets/home/category/category_row.dart';
import '../../widgets/home/occasion/occasions_row.dart';
import '../../widgets/home/products/products_widget.dart';
import '../../widgets/home/view_all_row.dart';

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
              child: BlocBuilder<HomeViewModel, HomeState>(
                builder: (context, state) {
                  if (state is HomeStateLoading) {
                    return Center(child: Lottie.asset(AppImages.loading));
                  }
                  if (state is HomeStateSuccess) {
                    final products = state.products!.products;
                    final categories = state.products!.categories;
                    final bestSeller = state.products!.bestSeller;
                    final occasion = state.products!.occasions;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAppbarHome(),
                        SizedBox(height: 16),
                        LocationWidget(),
                        SizedBox(height: 24),
                        ProductsWidget(productsHome: products),
                        SizedBox(height: 24),
                        ViewAllRow(
                          title: AppLocalizations.of(context)!.categories,
                          onPressed: () {
                            navKey.currentState!
                                .pushNamed(PageRouteName.product);
                          },
                        ),
                        SizedBox(height: 16),
                        CategoryRow(
                          categories: categories,
                        ),
                        const SizedBox(height: 24),
                        ViewAllRow(
                          title: AppLocalizations.of(context)!.best_Seller,
                          onPressed: () {},
                        ),
                        SizedBox(height: 16),
                        BestSellerRow(
                          bestSellerProducts: bestSeller,
                        ),
                        SizedBox(height: 24),
                        ViewAllRow(
                          title: AppLocalizations.of(context)!.occasions,
                          onPressed: () {},
                        ),
                        SizedBox(height: 16),
                        OccasionsRow(
                          occasionProduct: occasion,
                        ),
                      ],
                    );
                  }
                  return Center(
                    child: Lottie.asset(AppImages.error),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
