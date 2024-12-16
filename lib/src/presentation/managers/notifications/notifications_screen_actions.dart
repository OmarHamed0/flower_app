sealed class NotificationsScreenActions {}

class GetAllNotificationsAction extends NotificationsScreenActions {}
class GoToNotificationDetailsAction extends NotificationsScreenActions {
  final String? id;
  GoToNotificationDetailsAction({this.id});
}