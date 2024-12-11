import 'package:flower_app/src/data/api/core/response_model/checkout_place_order/place_order_response_model.dart';
import 'package:flower_app/src/domain/entities/place_order/PlaceOrderEntity.dart';

class PlaceOrderDto {
  final String? user;
  final List<OrderItem>? orderItems;
  final num? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  PlaceOrderDto({
   this.user,
    this.orderItems,
     this.totalPrice,
   this.paymentType,
     this.isPaid,
     this.isDelivered,
     this.id,
    this.createdAt,
     this.updatedAt,
  });

  factory PlaceOrderDto.fromResponse(PlaceOrderResponseModel response) {
    return PlaceOrderDto(
        user: response.order!.user,
        orderItems: response.order!.orderItems!
            .map((e) => OrderItem(
                  product: e.product!,
                  price: e.price!,
                  quantity: e.quantity!,
                  id: e.Id!,
                ))
            .toList(),
        totalPrice: response.order!.totalPrice,
        paymentType: response.order!.paymentType,
        isPaid: response.order!.isPaid,
        isDelivered: response.order!.isDelivered,
        id: response.order!.Id,
        createdAt: response.order!.createdAt,
        updatedAt: response.order!.createdAt);
  }

  PlaceOrderEntity toDomain() {
    return PlaceOrderEntity(
        user: user!,
        orderItems: orderItems!
            .map((e) => OrderItemEntity(
                  product: e.product,
                  price: e.price,
                  quantity: e.quantity,
                  id: e.id,
                ))
            .toList(),
        totalPrice: totalPrice!,
        paymentType: paymentType!,
        isPaid: isPaid!,
        isDelivered: isDelivered!,
        id: id!,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }
}

class OrderItem {
  final String? product;
  final int? price;
  final int? quantity;
  final String? id;

  OrderItem({
     this.product,
     this.price,
     this.quantity,
     this.id,
  });
}
