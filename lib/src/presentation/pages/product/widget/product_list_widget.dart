import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flower_app/src/presentation/pages/product/widget/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/product_entity/product_entity.dart';

class ProductListWidget extends StatelessWidget {
  final List<ProductEntity> products;
  const ProductListWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return DynamicHeightGridView(
        itemCount: products.length,
        crossAxisCount: 2,
        crossAxisSpacing: 17.w,
        mainAxisSpacing: 17.h,
        builder: (ctx, index) {
          return ProductItemWidget(
            productEntity: products[index],
          );
        });
  }
}
