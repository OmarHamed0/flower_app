import 'package:flower_app/config/helpers/shared_pre_keys.dart';
import 'package:flower_app/config/helpers/shared_pref_helper.dart';
import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flower_app/src/presentation/managers/splash/splash_actions.dart';
import 'package:flower_app/src/presentation/managers/splash/splash_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SplashViewModel extends Cubit<SplashStates> {
  SplashViewModel(): super(InitialState());

  Future<void> _navigateBasedOnToken() async {
    await Future.delayed(const Duration(seconds: 4));

    final userToken =
    await SharedPrefHelper.getSecureString(SharedPrefKeys.userToken);


    final nextRoute = (userToken != null && userToken.isNotEmpty)
        ? PageRouteName.baseScreen
        : PageRouteName.signIn;

    emit(NavigateToNextScreen(nextRoute));
  }

  void doAction(SplashActions action){
    switch (action) {
      case GetNextRouteAction():
        _navigateBasedOnToken();
        break;
    }
  }
}