
import 'package:bloc/bloc.dart';
import 'package:flower_app/src/presentation/managers/notifications/notifications_screen_actions.dart';
import 'package:flower_app/src/presentation/managers/notifications/notifications_screen_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotificationsViewModel extends Cubit<NotificationsScreenStates>{
  final NotificationsViewModel _notificationsViewModel;
  NotificationsViewModel(this._notificationsViewModel): super(InitialState());




  void doAction(NotificationsScreenActions action){
    switch (action) {

      case GetAllNotificationsAction():
        // TODO: Handle this case.
      case GoToNotificationDetailsAction():
        // TODO: Handle this case.
    }
  }
}