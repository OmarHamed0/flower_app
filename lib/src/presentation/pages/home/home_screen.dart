import 'package:flower_app/src/presentation/managers/home/home_state.dart';
import 'package:flower_app/src/presentation/managers/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../dependency_injection/di.dart';
import '../../managers/home/home_actions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = getIt.get<HomeViewModel>();

    return Scaffold(
      body: BlocProvider(
        create: (context) => homeViewModel,
        child: BlocBuilder<HomeViewModel, HomeState>(
          builder: (context, state) {
            return Center(
              child: InkWell(
                onTap: () {
                  homeViewModel.doAction(LoadHomeDataAction());
                },
                child: const Text(
                  "ali",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
