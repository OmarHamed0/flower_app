import 'package:flower_app/src/data/api/core/response_model/signin_response_model.dart';
import 'package:flower_app/src/domain/entities/sign_in_entity.dart';

class SignInResponseDto{
  String? message;

  SignInResponseDto({this.message});

   static SignInEntity toDomain(SignInResponseModel response){
    return SignInEntity(
      message: response.message
    );
  }
}
