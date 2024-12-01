import 'package:flower_app/config/helpers/shared_pre_keys.dart';
import 'package:flower_app/config/helpers/shared_pref_helper.dart';
import 'package:flower_app/src/data/api/api_services.dart';
import 'package:flower_app/src/data/api/core/requestes_models/signin_request_body.dart';
import 'package:flower_app/src/data/api/core/response_model/auth_response_models/signin_response_model.dart';
import 'package:flower_app/src/data/api/core/response_model/logout/Logout_response.dart';
import 'package:flower_app/src/data/data_sources/online_data_source/auth_datasource/online_data_source.dart';
import 'package:flower_app/src/data/models/auth/signup/request/sign_up_user_body.dart';
import 'package:flower_app/src/data/models/auth/signup/response/sign_up_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../../common/api_execute.dart';
import '../../../../../common/api_result.dart';
import '../../../models/auth/usr_model_dto.dart';

@Injectable(as: AuthOnlineDataSource)
class SignInOnlineDataSourceImpl implements AuthOnlineDataSource {
  ApiServices _apiServices;

  SignInOnlineDataSourceImpl(this._apiServices);

  @override
  Future<UserModelDTO> getLoggedUserData() async {
    String? token =
        await SharedPrefHelper.getSecureString(SharedPrefKeys.userToken);
    if (token == null) {
      return UserModelDTO(
        email: "",
        firstName: "Guest",
        lastName: "",
        id: "",
      );
    }
    String tokenWithBarrier = "Bearer $token";

    print(tokenWithBarrier);

    var response = await _apiServices.getLoggedUserData(tokenWithBarrier);
    print(response);
    return response.fromResponse();
  }

  @override
  Future<ApiResult<SignupResponseDto>> signUp(
      SignUpRequestBody signUpRequestBody) async {
    return executeApi<SignupResponseDto>(
      apiCall: () async {
        var response = await _apiServices.signUp(signUpRequestBody);
        return response;
      },
    );
  }

  @override
  Future<SignInResponseModel> signIn(String email, String password) async {
    var response = await _apiServices
        .signIn(SignInRequestBody(email: email, password: password));
    return response;
  }

  @override
  Future<LogOutResponse> logOut() async {
    String? token =
        await SharedPrefHelper.getSecureString(SharedPrefKeys.userToken);
    String tokenWithBarrier = "Bearer $token";
    var response = await _apiServices.logout(tokenWithBarrier);
    return response;
  }

  // Future<String> uploadPhoto(File photo) async {
  //   String? token =
  //       await SharedPrefHelper.getSecureString(SharedPrefKeys.userToken);
  //   if (token == null) {
  //     throw Exception('User token is null');
  //   }
  //
  //   // Validate file type
  //   if (!['.jpg', '.jpeg', '.png']
  //       .contains(photo.path.split('.').last.toLowerCase())) {
  //     throw Exception('Invalid file type. Only image files are allowed.');
  //   }
  //
  //   String tokenWithBearer = "Bearer $token";
  //
  //   try {
  //     // Prepare the file for upload
  //     List<MultipartFile> files = [
  //       MultipartFile.fromFileSync(photo.path,
  //           filename: 'photo.${photo.path.split('.').last}')
  //     ];
  //
  //     // Call the API to upload the photo
  //     var response = await _apiServices.uploadPhotos(tokenWithBearer, files[0]);
  //     return response; // Return the server response
  //   } catch (e) {
  //     print('Error uploading photo: $e');
  //     throw Exception('Failed to upload photo');
  //   }
  // }
}
