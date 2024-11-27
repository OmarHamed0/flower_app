import 'dart:developer';

import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/managers/categories/categories_action.dart';
import 'package:flower_app/src/presentation/managers/categories/categories_view_model.dart';
import 'package:flower_app/src/presentation/pages/categories/categories_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final viewModel = getIt.get<CategoriesViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..doAction(GetCategoriesAction()),
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<CategoriesViewModel, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesLoaded) {
                return CategoriesScreenBody();
              } else if (state is ChangeCategoryState) {
                log("ChangeCategoryState: id: ${state.id}");
                return CategoriesScreenBody(productId: state.id);
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}

