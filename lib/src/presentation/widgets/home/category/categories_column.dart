import 'package:flutter/material.dart';

import 'category_card.dart';

class CategoriesColumn extends StatelessWidget {
  const CategoriesColumn({
    super.key,
    required this.imageAsset,
    required this.title,
  });

  final String? imageAsset;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CategoryCard(imageAsset: imageAsset!),
        const SizedBox(height: 8),
        Text(
          title!,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
