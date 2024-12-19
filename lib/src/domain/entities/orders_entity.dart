class OrdersEntity {
  String? message;
  String? id;
  String? user;
  List<OrdersItems>? orders;
  num? totalPrice;
  String? paymentMethod;
  bool? isPaid;
  bool? isDelivered;
  String? createdAt;
  String? updatedAt;

  OrdersEntity({
    this.message,
    this.id,
    this.user,
    this.orders,
    this.totalPrice,
    this.paymentMethod,
    this.isPaid,
    this.isDelivered,
    this.createdAt,
    this.updatedAt,
  });
}

class OrdersItems {
  final String? product;
  final num? price;
  final num? quantity;
  final String? id;

  OrdersItems({this.product, this.price, this.quantity, this.id});
}
