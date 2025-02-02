import 'package:flower_app/src/domain/entities/orders_entity.dart';
import 'package:flower_app/src/presentation/managers/my_orders/my_orders_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/common.dart';
import '../../managers/my_orders/my_orders_view_model.dart';
import 'order_item_card.dart';

class MyOrdersScreenBody extends StatelessWidget {
  MyOrdersScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<MyOrdersViewModel>();
    final currentOrdersList = viewModel.orders[viewModel.currentTabIndex];
    String? buttonText;
    return BlocBuilder<MyOrdersViewModel, MyOrdersStates>(
        builder: (context, state) {
        if(state is LoadedMyOrdersState) {
          return  ListView.builder(
            itemCount: currentOrdersList.length,
            itemBuilder: (context, index) {
              if (viewModel.currentTabIndex == 0) {
                buttonText = "Track Order";
              } else {
                buttonText = "Reorder";
              }
              return OrderItemCard(
                item: currentOrdersList[index],
                buttonText: buttonText ?? "",
                index: index,
              );
            },
          );(context);
        }
        if (viewModel.list.isEmpty) {
          return const Center(child: Text("Empty"),);
        }
        return const SizedBox();
        return const SizedBox.shrink();
    });
  }

}
