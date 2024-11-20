import 'package:flower_app/flower_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../config/routes/page_route_name.dart';
import '../../../../core/styles/colors/app_colors.dart';
import '../../../../core/styles/fonts/app_font_weight.dart';
import '../../../../core/styles/texts/app_text_styles.dart';

class DonotHaveAccountRow extends StatelessWidget {
  const DonotHaveAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.dontHaveAccount,
          style: AppTextStyles.font16WeightMedium,
        ),
        InkWell(
          onTap: () {
            navKey.currentState!.pushNamed(PageRouteName.signup);
          },
          child: Text(
            AppLocalizations.of(context)!.signUp,
            style: AppTextStyles.font16WeightMedium.copyWith(
                color: AppColors.kBaseColor,
                fontWeight: AppFontWeights.medium,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.kBaseColor),
          ),
        ),
      ],
    );
  }
}
