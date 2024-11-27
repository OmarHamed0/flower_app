import 'dart:developer';
import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/src/presentation/managers/categories/categories_view_model.dart';
import 'package:flower_app/src/presentation/managers/product/core/product_core.dart';
import 'package:flower_app/src/presentation/pages/categories/category_bar.dart';
import 'package:flower_app/src/presentation/pages/product/view/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreenBody extends StatefulWidget {
  final String? productId;

  CategoriesScreenBody({super.key, this.productId});

  @override
  State<CategoriesScreenBody> createState() => _CategoriesScreenBodyState();
}

class _CategoriesScreenBodyState extends State<CategoriesScreenBody> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CategoriesViewModel>();
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
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: "Search",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: AppColors.kWhite70),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: AppColors.kWhite70),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
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
                        onPressed: () {},
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
          child: BlocBuilder<CategoriesViewModel,CategoriesState>(
              builder:(context, state){
                if(state is ChangeCategoryState){
                   log("rebuild with new product id os : ${widget.productId}");
                   return ProductView(productQuery: ProductQuery.category, productEndPoints: ProductEndPoints.products,productId:widget.productId,);
                }
                return ProductView();
              }
          ),
        )
      ],
    );
  }
}



