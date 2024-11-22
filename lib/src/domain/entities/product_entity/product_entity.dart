class ProductEntity {
  String? id;
  String? title;
  String? description;
  String? slug;
  String? imageCover;
  List<String>? images;
  int? price;
  int? priceAfterDiscount;
  int? quantity;

  ProductEntity({
    this.id,
    this.title,
    this.description,
    this.slug,
    this.imageCover,
    this.images,
    this.price,
    this.priceAfterDiscount,
    this.quantity
  });
}
