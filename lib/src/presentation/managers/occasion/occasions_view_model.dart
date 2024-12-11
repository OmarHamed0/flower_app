import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/api/core/error/error_handler.dart';
import 'package:flower_app/src/domain/entities/occasions/OccasionsEntity.dart';
import 'package:flower_app/src/domain/use_cases/occasions_use_case.dart';
import 'package:flower_app/src/presentation/managers/occasion/occasion_states.dart';
import 'package:flower_app/src/presentation/managers/occasion/occasions_actions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/common.dart';

@injectable
class OccasionViewModel extends Cubit<OccasionsStates>{
  final OccasionUseCase _occasionUseCase;

  ScrollController scrollController = ScrollController();
  OccasionViewModel(this._occasionUseCase): super(InitialState());

  void scrollToIndex(int index) {
    double position = index * 90.0;
    scrollController.animateTo(
      position,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  int selectedIndex = 0;
  List<OccasionsEntity> occasionsList = [];
  void _getOccasions() async{
    emit(LoadingState());
    final result = await _occasionUseCase.getOccasions();

    switch (result) {
      case Success<List<OccasionsEntity>>():
          occasionsList = result.data!;
          emit(LoadedState(occasions: result.data!));
      case Failures<List<OccasionsEntity>>():
        emit(ErrorState(exception: result.exception));
    }
  }

  void doAction(OccasionActions action){
    switch (action) {
      case GetOccasionsAction():
        _getOccasions();
        break;
      case ChangeOccasionAction():
        selectedIndex = action.index!;
        emit(ChangeOccasionState(id: occasionsList[selectedIndex].id!));
    }
  }
}