import 'package:flower_app/src/domain/entities/auth/signup/sign_up_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flower_app/src/domain/entities/auth/signup/sign_up_user.dart';

part 'sign_up_user_body.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? rePassword;
  final String? phone;
  final String? gender;

  SignUpRequestBody({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
    this.gender,
  });

  factory SignUpRequestBody.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);

  factory SignUpRequestBody.fromDomain(SignUpUser user) {
    return SignUpRequestBody(
      firstName: user.firstName,
      lastName: user.lastName,
      email: user.email,
      password: user.password,
      rePassword: user.rePassword,
      phone: user.phone,
      gender: user.gender,
    );
  }
  SignupResponse toDomain() => SignupResponse(

  );

}
