// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_orders_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserOrderResponseModel _$UserOrderResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserOrderResponseModel(
      message: json['message'] as String?,
      orders: json['orders'] == null
          ? null
          : Orders.fromJson(json['orders'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserOrderResponseModelToJson(
        UserOrderResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'orders': instance.orders,
    };

Orders _$OrdersFromJson(Map<String, dynamic> json) => Orders(
      Id: json['_id'] as String?,
      user: json['user'] as String?,
      orderItems: (json['orderItems'] as List<dynamic>?)
          ?.map((e) => OrderItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPrice: (json['totalPrice'] as num?)?.toInt(),
      paymentType: json['paymentType'] as String?,
      isPaid: json['isPaid'] as bool?,
      isDelivered: json['isDelivered'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
      '_id': instance.Id,
      'user': instance.user,
      'orderItems': instance.orderItems,
      'totalPrice': instance.totalPrice,
      'paymentType': instance.paymentType,
      'isPaid': instance.isPaid,
      'isDelivered': instance.isDelivered,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

OrderItems _$OrderItemsFromJson(Map<String, dynamic> json) => OrderItems(
      product: json['product'] as String?,
      price: (json['price'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      Id: json['_id'] as String?,
    );

Map<String, dynamic> _$OrderItemsToJson(OrderItems instance) =>
    <String, dynamic>{
      'product': instance.product,
      'price': instance.price,
      'quantity': instance.quantity,
      '_id': instance.Id,
    };
