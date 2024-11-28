import 'package:flower_app/core/styles/icons/app_icons.dart';
import 'package:flower_app/core/styles/images/app_images.dart';
import 'package:flutter/material.dart';

class CustomAppBarProfile extends StatelessWidget {
  const CustomAppBarProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          Image.asset(
            AppImages.logo,
            width: 90,
            height: 25,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage(AppIcons.notificationIcon),
            ),
          ),
        ],
      ),
    );
  }
}
