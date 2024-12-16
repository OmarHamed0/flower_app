class NotificationsScreenStates{}
class InitialState extends NotificationsScreenStates{}
class LoadingState extends NotificationsScreenStates{}
class LoadedState extends NotificationsScreenStates{}
class FailedState extends NotificationsScreenStates{
  final Exception? exception;
  FailedState(this.exception);
}
class GetNotificationDetails extends NotificationsScreenStates{
  String? id;
  GetNotificationDetails({this.id});
}

class DeleteNotificationState extends NotificationsScreenStates{
  String? notificationId;
  DeleteNotificationState({this.notificationId});
}

class UndoDeleteNotificationState extends NotificationsScreenStates{
}


class SuccessDeleteNotificationState extends NotificationsScreenStates{}
class FailDeleteNotificationState extends NotificationsScreenStates{
  final Exception? exception;
  FailDeleteNotificationState(this.exception);
}
class DeletingInProgressState extends NotificationsScreenStates{}