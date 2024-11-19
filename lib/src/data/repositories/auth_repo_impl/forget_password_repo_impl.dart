import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/online_data_source.dart';
import 'package:flower_app/src/data/dto/auth_response_dto/forget_password_response_dto.dart';
import 'package:flower_app/src/domain/entities/auth_request/forget_password_request.dart';
import 'package:flower_app/src/domain/entities/auth_response/forget_password_response.dart';
import 'package:flower_app/src/domain/repositories/auth_repo/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ForgetPasswordRepository)
class ForgetPasswordRepositoryImpl implements ForgetPasswordRepository {
  final OnlineDataSource _onlineDataSource;

  ForgetPasswordRepositoryImpl(this._onlineDataSource);

  @override
  Future<ApiResult<ForgetPasswordResponse>> forgetPassword(
      ForgetPasswordRequest requestBody) async {
    try {
      await _onlineDataSource.forgetPassword(requestBody);
      return Success(data: ForgetPasswordResponseDto().toDomain());
    } on Exception catch (e) {
      return Failures(exception: e);
    }
  }
}
