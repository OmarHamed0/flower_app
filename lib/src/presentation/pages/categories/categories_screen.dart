import 'dart:developer';

import 'package:flower_app/common/common.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/managers/categories/categories_view_model.dart';
import 'package:flower_app/src/presentation/pages/categories/categories_screen_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/styles/colors/app_colors.dart';
import '../product/widget/show_sort_options_bottom_sheet_widget.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final viewModel = getIt.get<CategoriesViewModel>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<CategoriesViewModel, CategoriesState>(
          builder: (context, state) {
            if (state is CategoriesLoaded) {
              return const CategoriesScreenBody();
            } else if (state is ChangeCategoryState) {
              log("ChangeCategoryState: id: ${state.id}");
              return CategoriesScreenBody(productId: state.id);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        bottomSheet: Container(
          margin:EdgeInsets.only(bottom: 12.h),
          child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kBaseColor,
                  alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                    horizontal: 20.w
                ),
              ),
              onPressed: () {
                showSortOptions(context);
              },
              label: Text(
                "Filter ",
                style: TextStyle(fontSize: 17.sp, color: AppColors.kWhiteBase),
              ),
              icon: const Icon(Icons.align_vertical_center_outlined,
                  color: AppColors.kWhiteBase),
            ),
        ),

      ),
    );
  }

}
