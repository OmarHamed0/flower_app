
import 'package:bloc/bloc.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/auth/signup/sign_up_response.dart';
import 'package:flower_app/src/domain/entities/auth/signup/sign_up_user.dart';
import 'package:flower_app/src/domain/use_cases/auth_use_cases/signup_user_use_case.dart';
import 'package:flower_app/src/presentation/auth/signup/manager/signup_states.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpViewModel extends Cubit<SignupViewState> {
  SignupUserUseCase signupUserUseCase;

  SignUpViewModel(this.signupUserUseCase) : super(InitialState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String gender = 'female';

  void signUp() async{
    emit(InitialState());
    var result = await  signupUserUseCase.execute(
        SignUpUser(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          password: passwordController.text,
          rePassword: confirmPasswordController.text,
          phone: phoneController.text,
          gender: gender,
        ));
    switch (result) {
      case Success<SignupResponse>():
        print("Signup successful");
        emit(SignupSuccessState(result.data));
        break;
      case Failures<SignupResponse>():
        emit(SignupErrorState(result.exception));
        break;
    }


  }

  bool isSignUpFormValid = true;

  void validateThenDoSignup() {
    final formState = formKey.currentState;
    if (formState != null && formState.validate()) {
      if (isSignUpFormValid == false) {
        isSignUpFormValid = true;
        emit(SignupValidationButtonState());
      }
      signUp();
    } else {
      isSignUpFormValid = false;
      emit(SignupValidationButtonState());
    }
  }


}