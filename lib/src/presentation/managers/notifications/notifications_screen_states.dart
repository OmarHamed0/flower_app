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