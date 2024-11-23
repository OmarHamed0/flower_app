import 'package:flower_app/core/styles/images/app_images.dart';
import 'package:flower_app/src/presentation/widgets/home/app_bar/search_textfeild.dart';
import 'package:flutter/material.dart';

class CustomAppbarHome extends StatelessWidget {
  const CustomAppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              AppImages.logo,
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(flex: 3, child: SearchTextfeild()),
        ],
      ),
    );
  }
}
