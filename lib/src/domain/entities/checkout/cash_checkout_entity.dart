class CashCheckoutEntity {
  final String? message;
  final OrderEntity? order;
  CashCheckoutEntity({this.message, this.order});
}

class OrderEntity{
  final String? user;
  final List<OrderItemsEntity>? orderItems;
  final num? totalPrice;
  final String? paymentType;
  final bool? isPaid;
  final bool? isDelivered;
  final String? id;
  final String? createdAt;
  final String? updatedAt;

  OrderEntity(
      {this.user,
      this.orderItems,
      this.totalPrice,
      this.paymentType,
      this.isPaid,
      this.isDelivered,
      this.id,
      this.createdAt,
      this.updatedAt});
}

class OrderItemsEntity{
  final ProductEntity? product;
  final num? price;
  final num? quantity;
  final String? id;

  OrderItemsEntity({this.product, this.price, this.quantity, this.id});
}

class ProductEntity{
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

  ProductEntity(
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
