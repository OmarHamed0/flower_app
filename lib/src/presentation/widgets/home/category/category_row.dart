import 'package:flutter/material.dart';

import '../../../../data/static/category_list.dart';
import 'categories_column.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CategoriesColumn(
              imageAsset: categoryList[index]['imageAsset'],
              title: categoryList[index]['title'],
            ),
          );
        },
      ),
    );
  }
}
