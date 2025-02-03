import 'package:flower_app/src/data/api/core/response_model/orders/user_orders_response_model.dart';
import 'package:flower_app/src/domain/entities/orders_entity.dart';

class OrdersDto{



  OrdersEntity toDomain(UserOrderResponseModel response) {
    return OrdersEntity(
      message: response.message,
      user: response.orders?.user,
      id: response.orders?.Id,
      totalPrice: response.orders?.totalPrice,
      paymentMethod: response.orders?.paymentType,
      isPaid: response.orders!.isPaid,
      isDelivered: response.orders?.isDelivered,
      orders: response.orders!.orderItems?.map((e)=> OrdersItems(
         id: e.Id,
         price: e.price,
        quantity: e.quantity,
        product: e.product
      )).toList()
    );
  }
}