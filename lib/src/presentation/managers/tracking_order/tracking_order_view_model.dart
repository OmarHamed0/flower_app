
import 'package:bloc/bloc.dart';
import 'package:flower_app/src/presentation/managers/tracking_order/tracking_order_actions.dart';
import 'package:flower_app/src/presentation/managers/tracking_order/tracking_order_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class TrackingOrderViewModel extends Cubit<TrackingOrderStates>{
  TrackingOrderViewModel() : super(TrackingOrderInitial());





  doAction(TrackingOrderActions action){
    switch (action) {
      case StartTrackingOrderAction():
        emit(StartTrackingOrderState());
        break;
      case GoToTrackingOrderPageAction():
        emit(GoToTrackingOrderPageState());
        break;
    }
  }
}