import 'package:flower_app/core/styles/texts/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProductPriceAndStatueRow extends StatelessWidget {
  const ProductPriceAndStatueRow({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("product price", style:AppTextStyles.font20WeightBold),
        Text("Statue: ", style: AppTextStyles.font16WeightMedium,)
      ],
    );
  }
}
