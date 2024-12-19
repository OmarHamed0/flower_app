import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/common.dart';
import '../../managers/my_orders/my_orders_view_model.dart';
import 'order_item_card.dart';

class MyOrdersScreenBody extends StatelessWidget {
  const MyOrdersScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<MyOrdersViewModel>();
    final currentOrdersList = viewModel.orders[viewModel.currentTabIndex];
    String? buttonText;
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        if (viewModel.currentTabIndex == 0) {
          buttonText = "Track Order";
        } else {
          buttonText = "Reorder";
        }
        return OrderItemCard(
          item: currentOrdersList[index],
          buttonText: buttonText ?? "",
        );
      },
    );
  }
}
