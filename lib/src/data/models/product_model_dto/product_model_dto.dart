import 'package:flower_app/src/data/api/core/response_model/beset_seller/beset_seller_model.dart';
import 'package:flower_app/src/data/api/core/response_model/product/product_response_model.dart';
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




  ProductEntity toProductEntity({required Products  productResponse}){
    return ProductEntity(
        title:productResponse.title ,
        price: productResponse.price ,
        priceAfterDiscount:productResponse.priceAfterDiscount ,
        id: productResponse.id ,
        images: productResponse.images ,
        description: productResponse.description ,
        imageCover:productResponse.imgCover ,
        quantity: productResponse.quantity ,
        slug: productResponse.slug
    );
  }
  ProductEntity toProductEntityBestSeller({required BestSeller  besetSeller}){
    return ProductEntity(
        title:besetSeller.title ,
        price: besetSeller.price ,
        priceAfterDiscount:besetSeller.priceAfterDiscount ,
        id: besetSeller.id ,
        images: besetSeller.images ,
        description: besetSeller.description ,
        imageCover:besetSeller.imgCover ,
        quantity: besetSeller.quantity ,
        slug: besetSeller.slug
    );
  }


  List<ProductEntity> listProduct(ProductResponseModel productResponse) {
    if (productResponse.products?.length == null) return [];
    List<ProductEntity> products =
    productResponse.products!.map((product) =>
        toProductEntity(productResponse: product),
    ).toList();
    return products;
  }


  List<ProductEntity> listProductBesetSeller(BesetSellerModel besetSeller) {
    if (besetSeller.bestSeller?.length == null) return [];
    List<ProductEntity> products =
    besetSeller.bestSeller!.map((besetSeller) =>
        toProductEntityBestSeller(besetSeller: besetSeller),
    ).toList();
    return products;
  }




}


