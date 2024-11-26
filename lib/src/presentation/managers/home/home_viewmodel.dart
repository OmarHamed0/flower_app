import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/data/api/core/error/error_handler.dart';
import 'package:flower_app/src/domain/entities/home/HomeResponseModel.dart';
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
    emit(const HomeStateLoading());
    final result = await _homeUseCase.getHomeData();
    switch (result) {
      case Success<HomeResponseModel>():
        final homeData = result.data;
        ProductLists productLists = ProductLists(
          products: homeData?.products,
          occasions: homeData?.occasions,
          bestSeller: homeData?.bestSeller,
        );
        emit(HomeStateSuccess(
          products: productLists,
        ));
        break;
      case Failures<HomeResponseModel>():
        final error = ErrorHandler.fromException(result.exception);
        emit(HomeStateFailure(error.errorMassage));
        break;
    }
  }
}
