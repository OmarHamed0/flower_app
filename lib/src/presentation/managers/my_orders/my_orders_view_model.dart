import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/orders_entity.dart';
import 'package:flower_app/src/domain/entities/product_entity/product_entity.dart';
import 'package:flower_app/src/domain/use_cases/orders/orders_use_case.dart';
import 'package:flower_app/src/presentation/managers/my_orders/my_orders_actions.dart';
import 'package:flower_app/src/presentation/managers/my_orders/my_orders_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/use_cases/product_use_cases/product_by_id_use_case.dart';


@injectable
class MyOrdersViewModel extends Cubit<MyOrdersStates>{
  final OrdersUseCase _ordersUseCase;
  final ProductByIdUseCase _productByIdUseCase;
  MyOrdersViewModel(this._ordersUseCase, this._productByIdUseCase) : super(InitialMyOrdersState());
  List<OrdersItems> activeOrders = [];
  List<OrdersItems> completedOrders = [];
  List<List<OrdersItems>> orders = [];
  int currentTabIndex = 0;
  void _getActiveOrders(){
    emit(LoadedMyOrdersState(cartItems: activeOrders));
  }

  void _getCompletedOrders() {
    emit(LoadedMyOrdersState(cartItems: completedOrders));
  }

  _getProductDetails(String productId) async{
    emit(LoadingMyOrdersState());
    var response = await _productByIdUseCase.getProductById(productId);
    switch (response) {
      case Success<ProductEntity>():
         emit(SuccessGetProductDetailsState(productEntity: response.data));
         break;
      case Failures<ProductEntity>():
        emit(FailureGetProductDetailsState(exception: response.exception));
        break;
    }
  }

  void _getLoggedUserCart() async{
    emit(LoadingMyOrdersState());
    final response = await _ordersUseCase.getUserOrders();
    switch (response) {
      case Success<OrdersEntity>():
        if(response.data?.isDelivered == false && response.data?.isPaid == false){
          activeOrders = response.data!.orders!;
          _getProductDetails(response.data!.id!);
        }else{
          completedOrders = response.data!.orders!;
        }
        if(currentTabIndex == 0) {
          _getActiveOrders();
        }
        else{
          _getCompletedOrders();
        }
        orders.add(activeOrders);
        orders.add(completedOrders);
        break;
      case Failures<OrdersEntity>():
        emit(ErrorMyOrdersState(exception: response.exception));
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