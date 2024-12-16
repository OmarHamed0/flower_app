import 'package:bloc/bloc.dart';
import 'package:flower_app/common/api_result.dart';
import 'package:flower_app/src/domain/entities/notifications/notifications_entity.dart';
import 'package:flower_app/src/domain/use_cases/notifications/notifications_use_cases.dart';
import 'package:flower_app/src/presentation/managers/notifications/notifications_screen_actions.dart';
import 'package:flower_app/src/presentation/managers/notifications/notifications_screen_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class NotificationsViewModel extends Cubit<NotificationsScreenStates> {
  final NotificationsUseCases _notificationsUseCases;

  NotificationsViewModel(this._notificationsUseCases) : super(InitialState());
  List<NotificationEntity> notificationsList = [];
  void _getAllNotifications() async {
    emit(LoadingState());
    final notifications = await _notificationsUseCases.getAllNotifications();
    switch (notifications) {
      case Success<List<NotificationEntity>>():
        notificationsList = notifications.data!;
        emit(LoadedState());
        break;
      case Failures<List<NotificationEntity>>():
        emit(FailedState(notifications.exception));
        break;
    }
  }

  void _deleteNotification(int index) {
    if(index == -1){
      return;
    }
    notificationsList.removeAt(index);
    emit(DeleteNotificationState(notificationId: notificationsList[index].id));
  }

  void _undoDeleteNotification() {
     _getAllNotifications();
    emit(UndoDeleteNotificationState());
  }

  void _deleteNotificationConfirmed() {
    emit(DeletingInProgressState());
  }
  void doAction(NotificationsScreenActions action) {
    switch (action) {
      case GetAllNotificationsAction():
        _getAllNotifications();
        break;
      case GoToNotificationDetailsAction():
         break;
      case DeleteNotificationAction():
        _deleteNotification(action.index??-1);
        break;
      case UndoDeleteNotificationAction():
         _undoDeleteNotification();
         break;
      case DeleteNotificationConfirmedAction():
        _deleteNotificationConfirmed();
        break;
    }
  }
}
