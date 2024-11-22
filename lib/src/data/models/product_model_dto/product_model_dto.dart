import 'package:flower_app/src/data/api/core/response_model/product_response_models/one_product_response_model.dart';
import 'package:flower_app/src/domain/entities/product_entity/product_entity.dart';

class ProductModelDto {
  String? id;
  String? title;
  String? description;
  String? slug;
  String? imageCover;
  List<String>? images;
  int? price;
  int? priceAfterDiscount;
  int? quantity;

  ProductModelDto(
      {this.id,
      this.title,
      this.description,
      this.slug,
      this.imageCover,
      this.images,
      this.price,
      this.priceAfterDiscount,
      this.quantity});

  factory ProductModelDto.fromResponse(OneProductResponseModel response) {
    return ProductModelDto(
      id: response.product!.id,
      title: response.product!.title,
      description: response.product!.description,
      slug: response.product!.slug,
      imageCover: response.product!.imgCover,
      images: response.product!.images,
      price: response.product!.price,
      priceAfterDiscount: response.product!.priceAfterDiscount,
      quantity: response.product!.quantity,
    );
  }

   ProductEntity toDomain(OneProductResponseModel response) {
    return ProductEntity(
      id: response.product!.id,
      title: response.product!.title,
      description: response.product!.description,
      slug: response.product!.slug,
      imageCover: response.product!.imgCover,
      images: response.product!.images,
      price: response.product!.price,
      priceAfterDiscount: response.product!.priceAfterDiscount,
      quantity: response.product!.quantity,
    );
  }
}
