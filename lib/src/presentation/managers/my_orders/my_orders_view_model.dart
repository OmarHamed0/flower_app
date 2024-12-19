
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/common/common.dart';
import 'package:flower_app/src/domain/entities/cart/cart_entity.dart';
import 'package:flower_app/src/domain/entities/cart/cart_product_entity.dart';
import 'package:flower_app/src/domain/use_cases/cart/get_logged_user_cart_use_case.dart';
import 'package:flower_app/src/presentation/managers/my_orders/my_orders_actions.dart';
import 'package:flower_app/src/presentation/managers/my_orders/my_orders_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


@injectable
class MyOrdersViewModel extends Cubit<MyOrdersStates>{
  final GetLoggedUserCartUseCase _getLoggedUserCartUseCase;
  MyOrdersViewModel(this._getLoggedUserCartUseCase) : super(InitialMyOrdersState());
  List<CartProductEntity> cartItems = [];
  List<CartProductEntity> activeOrders = [];
  List<CartProductEntity> completedOrders = [];
  void _getActiveOrders(){


    emit(LoadedMyOrdersState(cartItems: activeOrders));
  }

  void _getCompletedOrders() {


    emit(LoadedMyOrdersState(cartItems: completedOrders));
  }
  void _getLoggedUserCart() async{
    emit(LoadingMyOrdersState());
    final response = await _getLoggedUserCartUseCase.invoke();
    switch (response) {
      case Success<CartEntity>():
        cartItems = response.data!.cartList!;
        break;
      case Failures<CartEntity>():
        emit(ErrorMyOrdersState(exception: response.exception));
        break;
    }
  }
  void doAction(MyOrdersScreenActions action){
    switch (action) {
      case GetActiveOrdersAction():
        _getActiveOrders();
        break;
      case GetCompletedOrderAction():
        _getCompletedOrders();
       break;
      case GetUserCartItemsAction():
        _getLoggedUserCart();
        break;
    }
  }
}