import 'package:flower_app/src/data/api/core/requestes_models/edit_profile_request.dart';

class EditProfileModel {
  EditProfileModel({
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  }) {
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _phone = phone;
  }

  EditProfileModel.fromJson(dynamic json) {
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _phone = json['phone'];
  }
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _phone;

  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['phone'] = _phone;
    return map;
  }

  toRequest() {
    return EditProfileRequest(
      firstName: _firstName,
      lastName: _lastName,
      email: _email,
      phone: _phone,
    );
  }
}
