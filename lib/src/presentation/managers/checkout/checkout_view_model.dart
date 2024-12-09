import 'package:bloc/bloc.dart';
import 'package:flower_app/common/common.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_actions.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckoutViewModel extends Cubit<CheckOutStates>{
  CheckoutViewModel(): super(InitialCheckOutState());
  bool isSwitched = false;
  final ScrollController scrollController = ScrollController();
  void _switchToggle(){
    isSwitched = !isSwitched;
    emit(SwitchToggleState(isSwitched));
  }

  void doAction(CheckoutActions action){
    switch (action) {
      case SwitchToggleAction():
        _switchToggle();
        break;
      case AddNewAddressAction():
        // TODO: Handle this case.
    }
  }
}