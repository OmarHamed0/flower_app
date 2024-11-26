import 'package:flower_app/config/routes/app_route.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/core/styles/fonts/app_font_weight.dart';
import 'package:flower_app/src/presentation/managers/categories/categories_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../managers/categories/categories_action.dart';

class CategoryBar extends StatefulWidget {
    List<String?> categories = [];
   CategoryBar({super.key, required this.categories});

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<CategoriesViewModel>();
    selectedIndex = viewModel.selectedIndex;
    return SizedBox(
      height: 50, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories!.length,
        itemBuilder: (context, index) {
          return _buildCategoryItem(index,viewModel);
        },
      ),
    );
  }

  Widget _buildCategoryItem(int index,viewModel) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        viewModel.doAction(ChangeCategoryAction(index));
        setState(() {
          viewModel.selectedIndex = index;
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.categories[index]??"",
              style: TextStyle(
                color: isSelected ? AppColors.kBaseColor :AppColors.kWhite70,
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