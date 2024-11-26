import 'package:flutter/material.dart';

import '../../../../../core/styles/colors/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.imageAsset});

  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        color: AppColors.kLightPink,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: ImageIcon(
          AssetImage(imageAsset),
          size: 24,
          color: AppColors.kBaseColor,
        ),
      ),
    );
  }
}
