import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ViewAllRow extends StatelessWidget {
  const ViewAllRow({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        const Spacer(),
        const Text(
          'View All',
          style: TextStyle(
            color: AppColors.kBaseColor,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.kBaseColor,
            decorationThickness: 2,
          ),
        ),
      ],
    );
  }
}
