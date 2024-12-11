class PlaceOrderEntity {
  final String? user;
  final List<OrderItemEntity>? orderItems;
  final num? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  PlaceOrderEntity({
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
}

class OrderItemEntity {
  final String? product;
  final int? price;
  final int? quantity;
  final String? id;

  OrderItemEntity({
     this.product,
     this.price,
     this.quantity,
     this.id,
  });

}