import 'package:json_annotation/json_annotation.dart';

part 'logged_user_data_reponse_model.g.dart';

@JsonSerializable()
class LoggedUserDataResponseModel {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "user")
  final User? user;

  LoggedUserDataResponseModel ({
    this.message,
    this.user,
  });

  factory LoggedUserDataResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LoggedUserDataResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoggedUserDataResponseModelToJson(this);
  }
}

@JsonSerializable()
class User {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "firstName")
  final String? firstName;
  @JsonKey(name: "lastName")
  final String? lastName;
  @JsonKey(name: "email")
  final String? email;
  @JsonKey(name: "gender")
  final String? gender;
  @JsonKey(name: "phone")
  final String? phone;
  @JsonKey(name: "photo")
  final String? photo;
  @JsonKey(name: "role")
  final String? role;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  User ({
    this.Id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }
}


