import 'package:either_dart/either.dart';
import 'package:flower_app/src/domain/entities/user_entity.dart';

abstract class AuthRepository{
  Future<void> signIn(String email, String password);
  Future<Either<String,UserEntity>> getLoggedUserData();
}