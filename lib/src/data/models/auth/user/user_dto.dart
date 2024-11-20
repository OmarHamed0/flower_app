import 'package:flower_app/src/domain/entities/auth/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
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

  @JsonKey(name: "_id")
  final String? id;

  @JsonKey(name: "createdAt")
  final DateTime? createdAt;

  UserDto({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.id,
    this.createdAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);


  UserEntity toDomain() {
    return UserEntity(
      firstName: firstName,
      lastName: lastName,
      email: email,
      gender: gender,
      phone: phone,
      photo: photo,
      role: role,
      id: id,
      createdAt: createdAt,
    );
  }
}
