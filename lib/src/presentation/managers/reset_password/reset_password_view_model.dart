
import 'package:bloc/bloc.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/common/common.dart';
import 'package:flower_app/src/data/api/core/error/error_handler.dart';
import 'package:flower_app/src/domain/entities/auth/reset_password_entity.dart';
import 'package:flower_app/src/domain/use_cases/reset_password_use_case.dart';
import 'package:flower_app/src/presentation/managers/reset_password/reset_password_actions.dart';
import 'package:flower_app/src/presentation/managers/reset_password/reset_password_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordStates>{
  final ResetPasswordUseCase _resetPasswordUseCase;
  ResetPasswordViewModel(this._resetPasswordUseCase) : super(InitialState());
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  void _resetPassword() async{
    emit(LoadingState());
    var response = await _resetPasswordUseCase.resetPassword(oldPasswordController.text, newPasswordController.text);
    switch (response) {

      case Success<ResetPasswordEntity>():
        emit(SuccessState());
        break;
      case Failures<ResetPasswordEntity>():
         emit(ErrorState(message: _getErrorMessage(response)));
    }
  }


  String _getErrorMessage(Failures<ResetPasswordEntity> response) {
      var errorMessage  = ErrorHandler.fromException(response.exception).errorMassage;
      return errorMessage;
  }

  void doActin(ResetPasswordActions action){
    switch (action) {
      case ResetPasswordAction():
        _resetPassword();
        break;
    }
  }

}