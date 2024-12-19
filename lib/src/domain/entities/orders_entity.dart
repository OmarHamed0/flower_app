class OrdersEntity {
  String? message;
  String? id;
  String? user;
  List<OrdersItems>? orders;
  num? totalPrice;
  String? paymentMethod;
  String? isPaid;
  String? isDelivered;
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
  final num? id;

  OrdersItems({this.product, this.price, this.quantity, this.id});
}
