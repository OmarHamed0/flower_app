import 'package:either_dart/either.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/user_entity.dart';
import '../../entities/sign_in_entity.dart';

abstract class SignInRepo{
  Future<ApiResult<SignInEntity>> signIn(String email, String password);
  Future<bool> isLoggedUser();
  Future<Either<String,UserEntity>> getLoggedUserData();
}