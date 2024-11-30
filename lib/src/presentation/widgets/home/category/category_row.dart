import 'package:flower_app/src/domain/entities/home/category_model.dart';
import 'package:flutter/material.dart';

import 'categories_column.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({super.key, required this.categories});
  final List<CategoryModel>? categories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories?.length ?? 0,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CategoriesColumn(
              imageAsset: categories![index].image,
              title: categories?[index].name,
            ),
          );
        },
      ),
    );
  }
}
