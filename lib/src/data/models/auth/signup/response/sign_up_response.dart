import 'package:flower_app/src/data/models/auth/user/user_dto.dart';
import 'package:flower_app/src/domain/entities/auth/signup/sign_up_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignupResponseDto {
  @JsonKey(name: "message")
  final String? message;

  @JsonKey(name: "token")
  final String? token;

  @JsonKey(name: "user")
  final UserDto? user;

  SignupResponseDto({
    this.message,
    this.token,
    this.user,
  });

  factory SignupResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseDtoToJson(this);

  SignupResponse toDomain() {
    return SignupResponse(
      message: message,
      token: token,
      user: user?.toDomain(),
    );
  }
  static SignupResponse ToDomain(SignupResponseDto dto) {
    return SignupResponse(
      message: dto.message,
      token: dto.token,
      user: dto.user?.toDomain(),
    );
  }
}
