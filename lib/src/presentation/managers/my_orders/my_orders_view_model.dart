
import 'package:flower_app/common/common.dart';
import 'package:flower_app/src/presentation/managers/my_orders/my_orders_actions.dart';
import 'package:flower_app/src/presentation/managers/my_orders/my_orders_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


@injectable
class MyOrdersViewModel extends Cubit<MyOrdersStates>{
  MyOrdersViewModel() : super(InitialMyOrdersState());

  void _getActiveOrders(){

  }

  void _getCompletedOrders() {

  }
  void doAction(MyOrdersScreenActions action){
    switch (action) {

      case GetActiveOrdersAction():
        _getActiveOrders();
        break;
      case GetCompletedOrderAction():
        _getCompletedOrders();
       break;
    }
  }
}