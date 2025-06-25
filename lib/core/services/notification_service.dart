import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fruit_app/core/notification/presentation/notification_view.dart';
import 'package:fruit_app/main.dart';

abstract class NotificationMessageService {
  static FirebaseMessaging result = FirebaseMessaging.instance;

  static Future initMessage() async {
    await result.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      sound: true,
    );
    String? token = await result.getToken();
    log('Token: $token');
    _handleTerminationMessage();
  }

  static Future handleComingMessage(RemoteMessage? message) async {
    if (message == null) {
      return;
    }
    navigatorKey.currentState?.pushNamed(
      NotificationView.routeName,
      arguments: message,
    );
  }

  static Future _handleTerminationMessage() async {
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) => handleComingMessage(message),
    );
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) => handleComingMessage(message),
    );
  }
}
