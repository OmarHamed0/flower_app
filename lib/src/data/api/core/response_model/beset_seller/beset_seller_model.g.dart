// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beset_seller_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BesetSellerModel _$BesetSellerModelFromJson(Map<String, dynamic> json) =>
    BesetSellerModel(
      message: json['message'] as String?,
      bestSeller: (json['bestSeller'] as List<dynamic>?)
          ?.map((e) => BestSeller.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BesetSellerModelToJson(BesetSellerModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'bestSeller': instance.bestSeller,
    };

BestSeller _$BestSellerFromJson(Map<String, dynamic> json) => BestSeller(
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
      id: json['id'] as String?,
    );

Map<String, dynamic> _$BestSellerToJson(BestSeller instance) =>
    <String, dynamic>{
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
      'id': instance.id,
    };
