import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationViewer {
  static final FlutterLocalNotificationsPlugin
  _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static final Int64List _vibrationPattern = Int64List.fromList([500, 1000]);
  static final AndroidNotificationChannel _channel = AndroidNotificationChannel(
    "bankchannel", // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true,
    enableVibration: true,
    vibrationPattern: _vibrationPattern,
    showBadge: true,
  );

  static Future<void> initialize() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: androidInitializationSettings,
          iOS: initializationSettingsIOS,
        );

    await _flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
    );
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_channel);
    debugPrint("Notification channel initialized");
  }

  static Future<void> display(RemoteMessage message) async {
    try {
      NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          _channel.id,
          _channel.name,
          channelDescription: _channel.description,
          importance: Importance.high,
          priority: Priority.high,
          visibility: NotificationVisibility.public,
          channelShowBadge: true,
          playSound: true,
          vibrationPattern: _vibrationPattern,
          icon: '@mipmap/ic_launcher',
          enableVibration: true,
          enableLights: true,
          timeoutAfter: 10000,
        ),
        iOS: const DarwinNotificationDetails(),
      );

      int id = Random().nextInt(100000);
      RemoteNotification? notification = message.notification;
      if (notification != null) {
        await _flutterLocalNotificationsPlugin.show(
          id: id,
          title: notification.title,
          body: notification.body,
          notificationDetails: notificationDetails,
        );
      } else {
        await _flutterLocalNotificationsPlugin.show(
          id: id,
          title: "Data Payload",
          body: "Handling of data-only messages is not implemented.",
          notificationDetails: notificationDetails,
        );
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error displaying notification: $e');
    }
  }
}
