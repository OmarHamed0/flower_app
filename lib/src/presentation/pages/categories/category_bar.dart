import 'package:flower_app/config/routes/app_route.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/fonts/app_font_weight.dart';
import 'package:flower_app/src/presentation/managers/categories/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../managers/categories/categories_action.dart';

class CategoryBar extends StatelessWidget {
  final List<String?> categories;

  const CategoryBar({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CategoriesViewModel>();

    return SizedBox(
      height: 50,
      child: BlocBuilder<CategoriesViewModel, CategoriesState>(
        builder: (context, state) {
          int selectedIndex = viewModel.selectedIndex;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              bool isSelected = selectedIndex == index;
              return _buildCategoryItem(index, isSelected, viewModel);
            },
          );
        },
      ),
    );
  }

  Widget _buildCategoryItem(int index, bool isSelected, CategoriesViewModel viewModel) {
    return GestureDetector(
      onTap: () {
        if (viewModel.selectedIndex != index) {
          viewModel.doAction(ChangeCategoryAction(index));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              categories[index] ?? "",
              style: TextStyle(
                color: isSelected ? AppColors.kBaseColor : AppColors.kWhite70,
                fontWeight: isSelected ? AppFontWeights.bold : AppFontWeights.normal,
                fontSize: 16,
              ),
            ),
            if (isSelected)
              Container(
                margin: const EdgeInsets.only(top: 4),
                height: 2,
                width: 20,
                color: Colors.pink,
              ),
          ],
        ),
      ),
    );
  }
}
