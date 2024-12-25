// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_checkout_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashCheckoutResponseModel _$CashCheckoutResponseModelFromJson(
        Map<String, dynamic> json) =>
    CashCheckoutResponseModel(
      message: json['message'] as String?,
      order: json['order'] == null
          ? null
          : Order.fromJson(json['order'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CashCheckoutResponseModelToJson(
        CashCheckoutResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'order': instance.order,
    };

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      user: json['user'] as String?,
      orderItems: (json['orderItems'] as List<dynamic>?)
          ?.map((e) => OrderItems.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPrice: (json['totalPrice'] as num?)?.toInt(),
      paymentType: json['paymentType'] as String?,
      isPaid: json['isPaid'] as bool?,
      isDelivered: json['isDelivered'] as bool?,
      Id: json['_id'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'user': instance.user,
      'orderItems': instance.orderItems,
      'totalPrice': instance.totalPrice,
      'paymentType': instance.paymentType,
      'isPaid': instance.isPaid,
      'isDelivered': instance.isDelivered,
      '_id': instance.Id,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

OrderItems _$OrderItemsFromJson(Map<String, dynamic> json) => OrderItems(
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
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

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      Id: json['_id'] as String?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      imgCover: json['imgCover'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      price: (json['price'] as num?)?.toInt(),
      priceAfterDiscount: (json['priceAfterDiscount'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      category: json['category'] as String?,
      occasion: json['occasion'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      discount: (json['discount'] as num?)?.toInt(),
      sold: (json['sold'] as num?)?.toInt(),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.Id,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'imgCover': instance.imgCover,
      'images': instance.images,
      'price': instance.price,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'quantity': instance.quantity,
      'category': instance.category,
      'occasion': instance.occasion,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'discount': instance.discount,
      'sold': instance.sold,
      'id': instance.id,
    };
