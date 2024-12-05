import 'package:bloc/bloc.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_actions.dart';
import 'package:flower_app/src/presentation/managers/checkout/checkout_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckoutViewModel extends Cubit<CheckOutStates>{
  CheckoutViewModel(): super(InitialCheckOutState());




  void doAction(CheckoutActions action){
    switch (action) {

    }
  }
}