import 'package:flower_app/core/styles/fonts/app_fonts.dart';
import 'package:flower_app/src/presentation/managers/cart/cart_view_model.dart';
import 'package:flower_app/src/presentation/managers/product/product_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../common/common.dart';
import '../../../../../core/styles/images/app_images.dart';
import '../../../../data/api/core/error/error_handler.dart';
import '../../../../domain/entities/product_entity/product_entity.dart';
import '../../cart/widget/handle_state/handle_add_cart-state.dart';
import '../widget/product_list_widget.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(16.0.r),
      child: BlocListener<CartViewModel, CartState>(
        listener: (context, state) =>
            HandleAddCartState().handleBlocListenerAddCartState(context, state),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            return _handleBlocBuilder(state, context);
          },
        ),
      ),
    ));
  }

  Widget _handleBlocBuilder(ProductState state, BuildContext context) {
    if (state is GetProductLoadingState) {
      return _buildLoadingProductState();
    } else if (state is GetProductErrorState) {
      final errorHandler=ErrorHandler.fromException(state.exception, AppLocalizations.of(context)!);
      return _buildErrorProductState(errorMassage: errorHandler.errorMassage);
    } else {
      return _buildSuccessProduct(
          BlocProvider.of<ProductCubit>(context).products);
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
