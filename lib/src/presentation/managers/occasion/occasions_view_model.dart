import 'package:flower_app/src/domain/entities/occasions/OccasionsEntity.dart';
import 'package:flower_app/src/domain/use_cases/occasions_use_case.dart';
import 'package:flower_app/src/presentation/managers/occasion/occasion_states.dart';
import 'package:flower_app/src/presentation/managers/occasion/occasions_actions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class OccasionViewModel extends Cubit<OccasionsStates>{
  final OccasionUseCase _occasionUseCase;
  OccasionViewModel(this._occasionUseCase): super(InitialState());

  List<OccasionsEntity> occasionsList = [];
  void _getOccasions() async{
    emit(LoadingState());
    final result = await _occasionUseCase.getOccasions();

    result.when(
      success: (occasions){
        occasionsList = occasions;
        emit(LoadedState(occasions: occasions));
      },
      error: (message){
        emit(ErrorState(message: message));
      }
    );

  }

  void doAction(OccasionActions action){
    switch (action) {
      case GetOccasionsAction():
        _getOccasions();
        break;
      case ChangeOccasionAction():
        // TODO: Handle this case.
    }
  }
}