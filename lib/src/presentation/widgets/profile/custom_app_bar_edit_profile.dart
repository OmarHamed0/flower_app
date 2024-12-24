import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/icons/app_icons.dart';
import 'package:flutter/material.dart';

class CustomAppBarEditProfile extends StatelessWidget {
  const CustomAppBarEditProfile({super.key, required this.onBack});
  final void Function() onBack;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onBack,
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        horizontalSpace(4),
        const Text(
          'Edit Profile',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const ImageIcon(
            AssetImage(AppIcons.notificationIcon),
          ),
        ),
      ],
    );
  }
}
