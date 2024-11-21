import 'package:flower_app/src/presentation/managers/home/home_actions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/home_usecase.dart';
import 'home_state.dart';

@injectable
class HomeViewModel extends Cubit<HomeState> {
  final HomeUseCase _homeUseCase;

  HomeViewModel(this._homeUseCase) : super(const HomeStateLoading());

  void doAction(HomeAction action) {
    switch (action) {
      case LoadHomeDataAction():
        _loadHomeData();
        break;
    }
  }

  void _loadHomeData() async {
    var result = await _homeUseCase.getHomeData();
    print(result);
  }
}
