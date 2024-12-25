import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchTextfeild extends StatelessWidget {
  const SearchTextfeild({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () => Navigator.pushNamed(context, PageRouteName.search),
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.search,
        hintStyle: const TextStyle(color: AppColors.kWhite70, fontSize: 16),
        prefixIcon: const Icon(Icons.search, color: AppColors.kWhite70),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
          borderSide: const BorderSide(width: 1.5, color: AppColors.kWhite70),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24), // Rounded corners
          borderSide: const BorderSide(width: 1.5, color: AppColors.kWhite70),
        ),
        contentPadding: const EdgeInsets.symmetric(
            vertical: 12, horizontal: 16), // Adjust padding
      ),
    );
  }
}
