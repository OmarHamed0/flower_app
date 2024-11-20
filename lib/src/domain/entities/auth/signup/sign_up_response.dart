import 'package:flower_app/src/domain/entities/auth/user.dart';

class SignupResponse {
   String? message;
   String? token;
   UserEntity? user;

  SignupResponse({
    this.message,
    this.token,
    this.user,
  });
}
