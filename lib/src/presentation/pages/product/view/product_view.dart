
import 'package:flower_app/core/styles/fonts/app_fonts.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/managers/product/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/styles/images/app_images.dart';
import '../../../../domain/entities/product_entity/product_entity.dart';
import '../../../managers/product/core/product_core.dart';
import '../../../managers/product/product_event.dart';
import '../widget/product_list_widget.dart';

class ProductView extends StatefulWidget {
  String? productId;
  ProductQuery? productQuery;
  ProductEndPoints? productEndPoints;

  ProductView(
      {super.key,
      this.productEndPoints = ProductEndPoints.products,
      this.productQuery,
      this.productId});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  var productViewModel = getIt.get<ProductCubit>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productViewModel.doAction(GetProductEvent(
      productQueryParameters: ProductQueryParameters(
          productEndPoints: widget.productEndPoints!,
          productQuery: widget.productQuery,
          productId: widget.productId),
    ),);
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => productViewModel
        ..doAction(
          GetProductEvent(
            productQueryParameters: ProductQueryParameters(
                productEndPoints: widget.productEndPoints!,
                productQuery: widget.productQuery,
                productId: widget.productId),
          ),
        ),
      child: Scaffold(
          body: Padding(
              padding: EdgeInsets.all(16.0.r),
              child: BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, state) {
                return _handleBlocBuilder(state, context);
              },),)),
    );
  }

  Widget _handleBlocBuilder(ProductState state, BuildContext context) {
    if (state is GetProductLoadingState) {
      return _buildLoadingProductState();
    } else if (state is GetProductErrorState) {
      return _buildErrorProductState(errorMassage: state.errorMassage);
    } else if (state is GetProductSuccessState) {
      return _buildSuccessProduct(state.products);
    } else {
      return _productEmptyWidget();
    }
  }

  Widget _buildSuccessProduct(List<ProductEntity> products) {
    if (products.isEmpty) {
      return _productEmptyWidget();
    } else {
      return ProductListWidget(
        products: products,
      );
    }
  }

  Widget _buildErrorProductState({required String errorMassage}) {
    return Center(
      child: Lottie.asset(AppImages.error),
    );
  }

  Widget _buildLoadingProductState() {
    return Center(
      child: Lottie.asset(AppImages.loading),
    );
  }

  Widget _productEmptyWidget() {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(AppImages.loading),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "No Product List",
          style: AppFonts.font20Black500Weight,
        )
      ],
    ));
  }
}
