import 'package:flower_app/core/styles/icons/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/cached_network_image _widget.dart';

class ProfileImage extends StatelessWidget {
  final String? imageUrl;
  final bool isEditable;
  final void Function(BuildContext context)? showImagePicker;

  const ProfileImage(
      {super.key,
      this.imageUrl,
      this.isEditable = false,
      this.showImagePicker});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
        ),
        if (isEditable)
          Positioned(
            bottom: 2.w,
            right: 2.h,
            child: GestureDetector(
              onTap: () {
                showImagePicker!(context);
              },
              child: Container(
                padding: EdgeInsets.all(4.r),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.6),
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 18.sp,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
