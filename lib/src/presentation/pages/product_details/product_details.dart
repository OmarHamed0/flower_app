import 'package:flower_app/dependency_injection/di.dart';
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
      create: (_) => viewModel,
      child: SafeArea(
        child: BlocConsumer<ProductDetailsViewModel,ProductDetailsStates>(
          builder: (context,state){
            return const ProductDetailsBody();
          },
          listener: (BuildContext context, ProductDetailsStates state) {
          },
        ),
      ),
    );
  }
}
