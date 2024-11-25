import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ViewAllRow extends StatelessWidget {
  const ViewAllRow({super.key, required this.title, required this.onPressed});
  final String title;
  final void Function() onPressed;
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
        TextButton(
          onPressed: onPressed,
          child: Text(
            AppLocalizations.of(context)!.viewAll,
            style: const TextStyle(
              color: AppColors.kBaseColor,
              fontWeight: FontWeight.w500,
              fontSize: 12,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.kBaseColor,
              decorationThickness: 2,
            ),
          ),
        )
      ],
    );
  }
}
