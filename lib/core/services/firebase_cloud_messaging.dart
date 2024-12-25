import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flower_app/config/routes/page_route_name.dart';
import 'package:flower_app/flower_app.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseCloudMessaging {
  FirebaseCloudMessaging._();

  static FirebaseCloudMessaging? _instance;

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static FirebaseCloudMessaging getInstance() {
    return _instance ??= FirebaseCloudMessaging._();
  }
  Future<void> initializeFirebaseCloudMessaging() async {
    await _requestFirebaseMessagingPermissions();
    await _initializeLocalNotifications();
    await _retrieveDeviceToken();
    await _setupForegroundNotifications();
    _setupBackgroundAndTerminatedNotifications();
  }
  Future<void> _requestFirebaseMessagingPermissions() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }


  Future<void> _initializeLocalNotifications() async {
    const InitializationSettings initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
      macOS: DarwinInitializationSettings(),

    );

    await _localNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _handleNotificationTap,
    );
  }

  Future<void> _handleNotificationTap(NotificationResponse notificationResponse) async {
    navKey.currentState!.pushNamedAndRemoveUntil(PageRouteName.notifications, (route) => false,);
   }

  Future<void> _showLocalNotification(String title, String body) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'channel_description',
      importance: Importance.high,
      priority: Priority.high,
    );
    const NotificationDetails notificationDetails = NotificationDetails(android: androidDetails);

    await _localNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }

  Future<String?> _retrieveDeviceToken() async {
    String? deviceToken = await _firebaseMessaging.getToken();
    print("Device Token: $deviceToken");
    return deviceToken;
  }

  Future<void> _setupForegroundNotifications() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        _showLocalNotification(
          message.notification!.title ?? "welcome ",
          message.notification!.body ?? "",
        );
      }
    });
  }

  void _setupBackgroundAndTerminatedNotifications() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  FirebaseCloudMessaging.getInstance()._showLocalNotification(message.notification?.title ?? "",message.notification?.body ?? "");
}
