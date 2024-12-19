import 'package:flower_app/core/styles/colors/app_colors.dart';
import 'package:flower_app/dependency_injection/di.dart';
import 'package:flower_app/src/presentation/managers/my_orders/my_orders_states.dart';
import 'package:flower_app/src/presentation/managers/my_orders/my_orders_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/common.dart';

class MyOrdersScreen extends StatelessWidget {
  MyOrdersScreen({super.key});

  final viewModel = getIt.get<MyOrdersViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<MyOrdersViewModel, MyOrdersStates>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('My Orders'),
            bottom: const TabBar(indicatorColor: AppColors.kBaseColor,
                tabs: [
              Tab(text: 'Active'),
              Tab(text: 'Completed'),
            ]),
          ));
        },
      ),
    );
  }
}
