class CashCheckoutEntity {
  final String? message;
  final Order? order;
  CashCheckoutEntity({this.message, this.order});
}

class Order {
  final String? user;
  final List<OrderItems>? orderItems;
  final num? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? id_;
  final String? createdAt;
  final String? updatedAt;

  Order(
      {this.user,
      this.orderItems,
      this.totalPrice,
      this.paymentType,
      this.isPaid,
      this.isDelivered,
      this.id_,
      this.createdAt,
      this.updatedAt});
}

class OrderItems {
  final Product? product;
  final num? price;
  final num? quantity;
  final String? id_;

  OrderItems({this.product, this.price, this.quantity, this.id_});
}

class Product {
  final String? id_;
  final String? title;
  final String? slug;
  final String? description;
  final String? imgCover;
  final List<String>? images;
  final num? price;
  final num? priceAfterDiscount;
  final num? quantity;
  final String? category;
  final String? occasion;
  final String? createdAt;
  final String? updatedAt;
  final num? discount;
  final num? sold;
  final String? id;

  Product(
      {this.id_,
      this.title,
      this.slug,
      this.description,
      this.imgCover,
      this.images,
      this.price,
      this.priceAfterDiscount,
      this.quantity,
      this.category,
      this.occasion,
      this.createdAt,
      this.updatedAt,
      this.discount,
      this.sold,
      this.id});
}
