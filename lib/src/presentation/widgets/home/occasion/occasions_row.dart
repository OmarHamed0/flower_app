import 'package:flower_app/src/domain/entities/home/occasion_model.dart';
import 'package:flower_app/src/presentation/widgets/home/home_product_item.dart';
import 'package:flutter/material.dart';

class OccasionsRow extends StatelessWidget {
  const OccasionsRow({super.key, required this.occasionProduct});
  final List<OccasionsModel>? occasionProduct;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: occasionProduct?.length,
        itemBuilder: (context, index) {
          final occasions = occasionProduct?[index];
          return Container(
            margin: const EdgeInsets.only(right: 16),
            child: HomeProductItem(
              imageUrl: occasions?.image ?? "",
              title: occasions?.name ?? "",
            ),
          );
        },
      ),
    );
  }
}
