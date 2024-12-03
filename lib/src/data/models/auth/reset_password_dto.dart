import 'package:flower_app/src/data/api/core/response_model/auth_response_models/reset_password_response_model.dart';
import 'package:flower_app/src/domain/entities/auth/reset_password_entity.dart';

class ResetPasswordDto{
  String? message;
  ResetPasswordDto({this.message});


  static ResetPasswordEntity toDomain(ResetPasswordResponseModel response){
    return ResetPasswordEntity(
      message: response.message
    );
    }
}