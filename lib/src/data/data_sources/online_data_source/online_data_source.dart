import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/api/core/response_model/signin_response_model.dart';
import 'package:flower_app/src/data/models/usr_model_dto.dart';

abstract class OnlineDataSource{
  Future<SignInResponseModel> signIn(String email,String password);
  Future<UserModelDTO> getLoggedUserData();
}