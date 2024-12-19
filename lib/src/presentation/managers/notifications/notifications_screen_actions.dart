sealed class NotificationsScreenActions {}

class GetAllNotificationsAction extends NotificationsScreenActions {}
class GoToNotificationDetailsAction extends NotificationsScreenActions {
  final String? id;
  GoToNotificationDetailsAction({this.id});
}

class DeleteNotificationAction extends NotificationsScreenActions {
  int? index;
  DeleteNotificationAction({this.index});
}

class UndoDeleteNotificationAction extends NotificationsScreenActions {}
class DeleteNotificationConfirmedAction extends NotificationsScreenActions {
  final String? notificationId;
  DeleteNotificationConfirmedAction({required this.notificationId});
}