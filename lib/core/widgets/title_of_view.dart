import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

import 'main_back_button.dart';


class TitleOfView extends StatelessWidget {
  const TitleOfView({super.key, this.title, this.popWithResult});
  final String? title;
  final bool? popWithResult;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MainBackButton(popWithResult: popWithResult ?? false),
        horizontalSpace(8),
        Text(
          title ?? '',
          style: AppFonts.font20Black500Weight,
          // style: AppStyles.h1,
        ),
      ],
    );
  }
}
