import 'package:json_annotation/json_annotation.dart';

part 'signin_response_model.g.dart';

@JsonSerializable()
class SignInResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;

  SignInResponseModel({
    this.message,
    this.token,
  });

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SignInResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SignInResponseModelToJson(this);
  }
}
