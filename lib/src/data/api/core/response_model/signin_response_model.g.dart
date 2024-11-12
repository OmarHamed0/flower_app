// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponseModel _$SignInResponseModelFromJson(Map<String, dynamic> json) =>
    SignInResponseModel(
      message: json['message'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$SignInResponseModelToJson(
        SignInResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
    };
