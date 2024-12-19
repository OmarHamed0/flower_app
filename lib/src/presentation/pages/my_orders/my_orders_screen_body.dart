import 'package:flower_app/src/domain/entities/orders_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/common.dart';
import '../../managers/my_orders/my_orders_view_model.dart';
import 'order_item_card.dart';

class MyOrdersScreenBody extends StatelessWidget {

   MyOrdersScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return _handelCurrentView(context);
  }


  Widget _handelCurrentView(BuildContext context){
    final viewModel = context.read<MyOrdersViewModel>();
    final currentOrdersList = viewModel.orders[viewModel.currentTabIndex];
    if(currentOrdersList.isEmpty) {
      return _emptyOrders();
    }
    return _listView(context);
  }


  Widget _emptyOrders() {
    return const Center(
      child: Text("No Orders Found"),
    );
  }

  Widget _listView(BuildContext context){
    final viewModel = context.read<MyOrdersViewModel>();
    final currentOrdersList = viewModel.orders[viewModel.currentTabIndex];
    String? buttonText;
    return ListView.builder(
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
        );
      },
    );
  }
}
