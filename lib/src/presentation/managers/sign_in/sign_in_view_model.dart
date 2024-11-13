import 'package:bloc/bloc.dart';
import 'package:flower_app/src/domain/use_cases/auth_use_cases.dart';
import 'package:flower_app/src/presentation/managers/sign_in/sign_in_actions.dart';
import 'package:flower_app/src/presentation/managers/sign_in/sign_in_states.dart';
import 'package:injectable/injectable.dart';




@injectable
class SignInViewModel extends Cubit<SignInStates>{
  final AuthUseCases authUseCases;
  SignInViewModel(this.authUseCases) : super(SignInInitialState());



  void doAction(SignInActions action){
    switch (action) {

    }
  }
}