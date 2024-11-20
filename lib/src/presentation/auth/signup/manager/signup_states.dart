import 'package:flower_app/src/data/models/auth/signup/request/sign_up_user_body.dart';
import 'package:flower_app/src/domain/entities/auth/signup/sign_up_response.dart';

sealed class SignupViewState {}

class InitialState extends SignupViewState {}

class SignupLoadingState extends SignupViewState {}

class SignupErrorState extends SignupViewState {
  final String message;
  SignupErrorState(this.message);
}

class SignupSuccessState extends SignupViewState {
  SignupResponse? authResponse;
  SignupSuccessState(this.authResponse);
}

class PopDialogState extends SignupViewState{}

class SignupValidationButtonState extends SignupViewState{}
