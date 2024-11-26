import 'package:flower_app/core/functions/spacing.dart';
import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/managers/categories/categories_action.dart';
import 'package:flower_app/src/presentation/managers/categories/categories_view_model.dart';
import 'package:flower_app/src/presentation/managers/product/core/product_core.dart';
import 'package:flower_app/src/presentation/pages/categories/categories_screen_body.dart';
import 'package:flower_app/src/presentation/pages/product/view/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'category_bar.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final String productId = "673c46fd1159920171827c85";

  final viewModel = getIt<CategoriesViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        viewModel.doAction(GetCategoriesAction());
        return viewModel;
      },
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<CategoriesViewModel, CategoriesState>(
            builder: (context, state) {
              if(state is CategoriesLoading){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if(state is CategoriesLoaded || state is ChangeCategory){
                return const CategoriesScreenBody();
              } else if(state is CategoriesError){
                return Center(
                  child: Text(state.message),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}