import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/api/core/response_model/signin_response_model.dart';
import 'package:flower_app/src/domain/entities/sign_in_entity.dart';

class SignInResponseDto{
  String? message;

  SignInResponseDto({this.message});

   static SignInEntity toDomain(Success<SignInResponseModel> response){
    return SignInEntity(
      message: response.data!.message
    );
  }
}