import 'package:flower_app/config/routes/app_route.dart';
import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/src/presentation/managers/product_details/product_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPriceAndStatueRow extends StatelessWidget {
  const ProductPriceAndStatueRow({super.key});

  @override
  Widget build(BuildContext context) {
    final product = context.read<ProductDetailsViewModel>().productEntity;
    final viewModel = context.read<ProductDetailsViewModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("EPG ${product?.price ?? 0}",
            style: AppTextStyles.font20WeightBold),
        Text(
          "Statue: ${viewModel.checkStock(product?.quantity ?? 0)}",
          style: AppTextStyles.font16WeightMedium,
        )
      ],
    );
  }
}
