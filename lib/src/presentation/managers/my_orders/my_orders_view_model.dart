
import 'package:flower_app/src/presentation/managers/my_orders/my_orders_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


@injectable
class MyOrdersViewModel extends Cubit<MyOrdersStates>{
  MyOrdersViewModel() : super(InitialMyOrdersState());
}