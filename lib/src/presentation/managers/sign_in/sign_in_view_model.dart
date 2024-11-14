import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/use_cases/auth_use_cases.dart';
import 'package:flower_app/src/presentation/managers/sign_in/sign_in_actions.dart';
import 'package:flower_app/src/presentation/managers/sign_in/sign_in_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


@injectable
class SignInViewModel extends Cubit<SignInStates>{
  final AuthUseCases _authUseCases;
  SignInViewModel(this._authUseCases) : super(SignInInitialState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isBoxChecked = false;


  void _signIn() async{
    emit(SignInLoadingState());
    String email = emailController.text;
    String password = passwordController.text;
    var response = await _authUseCases.signIn(email, password);
    if(response is Success<String>){
      emit(SignInSuccessState());
    }else if(response is Failures<String>){
      emit(SingInFailedState("error"));
    }
  }

  void doAction(SignInActions action){
    switch (action) {
      case SignInClickAction():
        _signIn();
        break;
    }
  }
}