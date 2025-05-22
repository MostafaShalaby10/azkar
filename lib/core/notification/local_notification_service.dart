import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  // For solving errors in receive background notification
  static onNotification(NotificationResponse notificationResponse) {}
  static Future init() async {
    InitializationSettings initializationSettings =
        const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
          iOS: DarwinInitializationSettings(),
        );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,

      onDidReceiveBackgroundNotificationResponse: onNotification,
      onDidReceiveNotificationResponse: onNotification,
    );
  }

  static void showSimpleNotification() async {
    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      "10",
      "High Importance Notifications",
      importance: Importance.max,
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        importance: Importance.high,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
      ),
      iOS: const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );
    flutterLocalNotificationsPlugin.show(
      0,
      "  message.notification!.title",
      " message.notification!.body",
      notificationDetails,
    );
  }

  static void showScheduleNotificationForAzan(int id, int seconds) async {
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        "1",
        "High Importance Notifications",
        importance: Importance.max,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
        sound: RawResourceAndroidNotificationSound("azan.wav".split('.').first),
      ),
      iOS: const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation("Africa/Cairo"));
    var currentTime = tz.TZDateTime.now(tz.local);
    var scheduleTime = tz.TZDateTime(
      tz.local,
      currentTime.year,
      currentTime.month,
      currentTime.day,
      15,
      08
    );
    if (scheduleTime.isBefore(currentTime)) {
      scheduleTime = scheduleTime.add(const Duration(days: 1));
    }
    log(currentTime.day.toString());
    log(currentTime.hour.toString());
    log(currentTime.minute.toString());
    log("-----------------------------");
    log(scheduleTime.day.toString());
    log(scheduleTime.hour.toString());
    log(scheduleTime.minute.toString());
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      "$seconds",
      " message.notification!.body",
      scheduleTime,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
    );
  }
}
