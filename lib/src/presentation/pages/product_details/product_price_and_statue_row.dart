import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flower_app/src/presentation/managers/product_details/product_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductPriceAndStatueRow extends StatelessWidget {
  const ProductPriceAndStatueRow({super.key});

  @override
  Widget build(BuildContext context) {
    final product = context.read<ProductDetailsViewModel>().productEntity;
    final viewModel = context.read<ProductDetailsViewModel>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("${AppLocalizations.of(context)!.egp} ${product?.price ?? 0}",
            style: AppTextStyles.font20WeightBold),
        Text(
          "${AppLocalizations.of(context)!.statue}: ${viewModel.checkStock(product?.quantity ?? 0)}",
          style: AppTextStyles.font16WeightMedium,
        )
      ],
    );
  }
}
