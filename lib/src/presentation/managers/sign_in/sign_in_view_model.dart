import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/config/extensions/extensions.dart';
import 'package:flower_app/config/helpers/app_regex.dart';
import 'package:flower_app/src/data/api/core/error/error_handler.dart';
import 'package:flower_app/src/domain/entities/sign_in_entity.dart';
import 'package:flower_app/src/domain/use_cases/auth_use_cases/sign_in_use_case.dart';
import 'package:flower_app/src/presentation/managers/sign_in/sign_in_actions.dart';
import 'package:flower_app/src/presentation/managers/sign_in/sign_in_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@injectable
class SignInViewModel extends Cubit<SignInStates>{
  final SignInUseCase _signInUseCase;
  SignInViewModel(this._signInUseCase) : super(SignInInitialState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  bool isBoxChecked = false;
  bool isObscureText = true;


  void _signIn() async{
    String email = emailController.text;
    String password = passwordController.text;
    if(!signInFormKey.currentState!.validate()){
      emit(FormErrorState());
      return;
    }
    emit(SignInLoadingState());
    var response = await _signInUseCase.signIn(email, password);
    emit(PopDialogState());
    switch (response) {
      case Success<SignInEntity>():
        emit(PopDialogState());
        emit(SignInSuccessState());
        break;
      case Failures<SignInEntity>():
        emit(PopDialogState());
        final error = ErrorHandler.fromException(response.exception);
        emit(SignInFailedState(error.errorMassage));
        break;
    }
  }

  void _changePasswordVisibility(){
    isObscureText = !isObscureText;
    isObscureText ? emit(NonVisiblePasswordState()):emit(VisiblePasswordState());
  }

  void _checkBox(){
    isBoxChecked = !isBoxChecked;
    emit(CheckBoxState());
  }

  String? validateEmail(){
    String? email = emailController.text;
    if(email.isNullOrEmpty() || !AppRegex.emailValidationRegex.hasMatch(email)){
      return "This Email is not valid";
    }
    return null;
  }

   String? validatePassword(){
    String? password = passwordController.text;
    if(password.length < 8){
      return "Password must be more than 8";
    }
    if(password.isNullOrEmpty() || !AppRegex.passwordValidationRegex.hasMatch(password)){
      return "invalid Password";
    }

    return null;
  }

  void doAction(SignInActions action){
    switch (action) {
      case SignInClickAction():
        _signIn();
        break;
      case ChangePasswordVisibilityAction():
        _changePasswordVisibility();
        break;
      case ChangeCheckBoxAction():
        _checkBox();
        break;
    }
  }
}