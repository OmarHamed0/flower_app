import 'package:flower_app/core/styles/icons/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/cached_network_image _widget.dart';

class ProfileImage extends StatelessWidget {
  final String? imageUrl;

  const ProfileImage({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 80.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: imageUrl != null && imageUrl!.isNotEmpty
            ? CachedNetworkImageWidget(
                imageUrl: imageUrl!,
                width: 80.w,
                height: 80.h,
              )
            : Image.asset(
                AppIcons.noProfilePhoto,
                width: 80.w,
                height: 80.h,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
