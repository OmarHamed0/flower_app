import 'app_regex.dart';

String? validateName(String? name) {
  if (name!.isEmpty || !AppRegExp.isNameValid(name)) {
    return 'Name is required';
  }
  return null;
}

String? validateCity(String? city) {
  if (city!.isEmpty || !AppRegExp.isNameValid(city)) {
    return 'City is required';
  }
  return null;
}

String? validateStreet(String? street) {
  if (street!.isEmpty || !AppRegExp.isNameValid(street)) {
    return 'Street is required';
  }
  return null;
}

String? validateEmail(String? email) {
  if (email!.isEmpty || !AppRegExp.isEmailValid(email)) {
    return 'Email is required!';
  } else if (!email.contains('@')) {
    return 'Invalid Email!';
  }
  return null;
}

String? validatePhoneNumber(String? phoneNumber) {
  if (phoneNumber!.isEmpty || !AppRegExp.isPhoneNumberValid(phoneNumber)) {
    return 'Phone number is required!';
  }
  return null;
}

String? validatePassword(String? password) {
  if (password!.isEmpty || !AppRegExp.isPasswordValid(password)) {
    return 'Password is required!';
  }
  return null;
}

String? validateConfirmPassword(String? password, String? confirmPassword) {
  if (confirmPassword!.isEmpty || !AppRegExp.isPasswordValid(confirmPassword)) {
    return 'Confirm Password is required!';
  } else if (password != confirmPassword) {
    return 'Password and Confirm Password must be same!';
  }
  return null;
}

String? validateOTP(String? otp) {
  if (otp!.isEmpty || !AppRegExp.isOTPValid(otp)) {
    return 'OTP is required!';
  }
  return null;
}

String? validateUsername(String? username) {
  if (username!.isEmpty || !AppRegExp.isUsernameValid(username)) {
    return 'Username is required!';
  }
  return null;
}
