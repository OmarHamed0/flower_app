class CartProductEntity{
  String? id;
  String? title;
  String? description;
  String? imgCover;
  int? price;
  int? priceAfterDiscount;
  int? quantity;
  int ? counterQuantity;

  CartProductEntity({
    this.id,
    this.title,
    this.description,
    this.imgCover,
    this.price,
    this.quantity,
    this.counterQuantity ,
    this.priceAfterDiscount,
  });
}