// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addresses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Addresses _$AddressesFromJson(Map<String, dynamic> json) => Addresses(
      street: json['street'] as String?,
      phone: json['phone'] as String?,
      city: json['city'] as String?,
      Id: json['_id'] as String?,
    );

Map<String, dynamic> _$AddressesToJson(Addresses instance) => <String, dynamic>{
      'street': instance.street,
      'phone': instance.phone,
      'city': instance.city,
      '_id': instance.Id,
    };
