import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/managers/product_details/product_details_actions.dart';
import 'package:flower_app/src/presentation/managers/product_details/product_details_states.dart';
import 'package:flower_app/src/presentation/managers/product_details/product_details_view_model.dart';
import 'package:flower_app/src/presentation/pages/product_details/product_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetails extends StatelessWidget {


  ProductDetails({super.key});
  final viewModel = getIt.get<ProductDetailsViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        viewModel.doAction(GetProductByIdAction("673e1cd711599201718280fb"));
        return viewModel;
      },
      child: SafeArea(
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
                const SnackBar(
                  content: Text("Error"),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
