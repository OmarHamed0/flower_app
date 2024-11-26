import 'package:flower_app/src/domain/entities/home/best_seller_model.dart';
import 'package:flower_app/src/presentation/widgets/home/home_product_item.dart';
import 'package:flutter/material.dart';

class BestSellerRow extends StatelessWidget {
  const BestSellerRow({super.key, required this.bestSellerProducts});
  final List<BestSellerModel>? bestSellerProducts;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bestSellerProducts?.length,
        itemBuilder: (context, index) {
          final bestSeller = bestSellerProducts?[index];
          return Container(
            margin: const EdgeInsets.only(right: 16),
            child: HomeProductItem(
              imageUrl: bestSeller?.imgCover ?? "", // Ensure default value
              title: bestSeller?.title ?? "Unknown Product", // Fallback title
              price: bestSeller?.price ?? 0, // Fallback price
            ),
          );
        },
      ),
    );
  }
}
