import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/managers/cart/cart_view_model.dart';
import 'package:flower_app/src/presentation/managers/product_details/product_details_actions.dart';
import 'package:flower_app/src/presentation/managers/product_details/product_details_states.dart';
import 'package:flower_app/src/presentation/managers/product_details/product_details_view_model.dart';
import 'package:flower_app/src/presentation/pages/cart/widget/handle_add_cart-state.dart';
import 'package:flower_app/src/presentation/pages/product_details/product_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatelessWidget {
  final String productId;

  ProductDetails({super.key, required this.productId});

  final viewModel = getIt.get<ProductDetailsViewModel>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            viewModel.doAction(GetProductByIdAction(productId));
            return viewModel;
          },
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: BlocListener<CartViewModel, CartState>(
            listener: (context, state) {
              HandleAddCartState()
                  .handleBlocListenerAddCartState(context, state);
            },
            child: BlocConsumer<ProductDetailsViewModel, ProductDetailsStates>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SuccessState) {
                  return const ProductDetailsBody();
                } else if (state is FailedState) {
                  return const Center(child: Text(""));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
              listener: (BuildContext context, ProductDetailsStates state) {
                if (state is FailedState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error!),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
