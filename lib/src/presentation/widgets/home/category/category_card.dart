import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/styles/colors/app_colors.dart';
import '../../../../../core/widgets/cached_network_image _widget.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.imageAsset});

  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68.w, // Using screenutil for responsiveness
      height: 68.h, // Using screenutil for responsiveness
      decoration: BoxDecoration(
        color: AppColors.kLightBink,
        borderRadius:
            BorderRadius.circular(20.r), // Rounded corners with screenutil
      ),
      child: Center(
        child: ClipOval(
          child: CachedNetworkImageWidget(
            imageUrl: imageAsset,
            width: 24.w, // Adjust icon size with screenutil
            height: 24.h, // Adjust icon size with screenutil
          ),
        ),
      ),
    );
  }
}
