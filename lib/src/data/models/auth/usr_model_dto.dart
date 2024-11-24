import 'package:flower_app/src/data/api/core/response_model/auth_response_models/logged_user_data_reponse_model.dart';
import 'package:flower_app/src/domain/entities/auth/user_entity.dart';

class UserModelDTO {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? role;
  String? photo;

  UserModelDTO(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.gender,
      this.phone,
      this.photo,
      this.role});

  factory UserModelDTO.fromResponse(LoggedUserDataResponseModel response) {
    return UserModelDTO(
        id: response.user!.Id,
        firstName: response.user!.firstName,
        lastName: response.user!.lastName,
        email: response.user!.email,
        gender: response.user!.gender,
        phone: response.user!.phone,
        photo: response.user!.role,
        role: response.user!.photo);
  }

  UserEntity toDomain() {
    return UserEntity(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
        gender: gender,
        phone: phone,
        photo: photo,
        role: role);
  }
}
