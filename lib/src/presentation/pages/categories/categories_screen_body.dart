import 'dart:developer';
import 'package:flower_app/common/common.dart';
import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/fonts/app_fonts.dart';
import 'package:flower_app/src/presentation/managers/categories/categories_view_model.dart';
import 'package:flower_app/src/presentation/managers/product/core/product_core.dart';
import 'package:flower_app/src/presentation/managers/product/product_cubit.dart';
import 'package:flower_app/src/presentation/pages/categories/category_bar.dart';
import 'package:flower_app/src/presentation/pages/product/view/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../managers/product/product_event.dart';
import '../product/widget/show_sort_options_bottom_sheet_widget.dart';

class CategoriesScreenBody extends StatefulWidget {
  final String? productId;

  const CategoriesScreenBody({super.key, this.productId});

  @override
  State<CategoriesScreenBody> createState() => _CategoriesScreenBodyState();
}

class _CategoriesScreenBodyState extends State<CategoriesScreenBody> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CategoriesViewModel>();
    final productViewModel = context.read<ProductCubit>();
    log("in new screen product id is : ${widget.productId}");
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, PageRouteName.search),
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                color: AppColors.kWhite70,
                              )),
                          child: TextButton.icon(
                            onPressed: () {},
                            label: Text(
                              "Search",
                              style: AppFonts.font14Gray400Weight70,
                            ),
                            icon: const Icon(
                              Icons.search,
                              color: AppColors.kGray,
                            ),
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                        ),
                      ),
                    ),
                    horizontalSpace(8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.filter_list),
                        onPressed: () {
                          showSortOptions(context);
                        },
                      ),
                    ),
                  ],
                ),
                verticalSpace(16),
                CategoryBar(
                  categories: viewModel.categories.map((e) => e.name).toList(),
                ),
                verticalSpace(24),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: BlocBuilder<CategoriesViewModel, CategoriesState>(
              builder: (context, state) {
            if (state is ChangeCategoryState) {
              productViewModel.doAction(GetProductEvent(
                  productQueryParameters: ProductQueryParameters(
                productEndPoints: ProductEndPoints.products,
                productQuery: ProductQuery.category,
                productId: widget.productId,
              )));
              return const ProductView();
            } else {
              productViewModel.doAction(GetProductEvent(
                productQueryParameters: ProductQueryParameters(
                    productEndPoints: ProductEndPoints.products),
              ));
              return const ProductView();
            }
          }),
        )
      ],
    );
  }
}
