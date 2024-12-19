import 'package:flower_app/src/presentation/pages/my_orders/order_item_card_shimmer.dart';

import '../../../../common/common.dart';
import 'order_item_card.dart';

class MyOrdersScreenBody extends StatelessWidget {
  const MyOrdersScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 2,
        itemBuilder: (context,index){
          return const OrderItemCard();
        });
  }
}
