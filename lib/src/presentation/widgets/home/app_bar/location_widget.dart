import 'package:flutter/material.dart';

import '../../../../../core/styles/colors/app_colors.dart';
import '../../../../../core/styles/icons/app_icons.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ImageIcon(
          AssetImage(AppIcons.locationIcon),
          size: 20,
        ),
        SizedBox(width: 8),
        Text(
          'Deliver to 2XVP+XC - Sheikh Zayed ',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        SizedBox(width: 8),
        ImageIcon(
          AssetImage(AppIcons.arrowDownIcon),
          size: 16,
          color: AppColors.kBaseColor,
        ),
      ],
    );
  }
}
