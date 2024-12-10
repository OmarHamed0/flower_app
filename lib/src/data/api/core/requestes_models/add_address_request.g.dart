// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_address_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAddressRequest _$AddAddressRequestFromJson(Map<String, dynamic> json) =>
    AddAddressRequest(
      street: json['street'] as String?,
      phone: json['phone'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$AddAddressRequestToJson(AddAddressRequest instance) =>
    <String, dynamic>{
      'street': instance.street,
      'phone': instance.phone,
      'city': instance.city,
    };
