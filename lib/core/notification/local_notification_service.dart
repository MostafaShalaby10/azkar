import 'dart:developer';

import 'package:azkar/core/utils/shared_prefrences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  // For solving errors in receive background notification
  static onNotification(NotificationResponse notificationResponse) {}
  static Future init() async {
    PermissionStatus status = await Permission.notification.request();
    if (status.isGranted) {
      log("Notification permission Accessed");

      await SharedPrefs.saveData(key: "notifications", value: true);
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
    } else {
      log("Notification permission denied");
      await SharedPrefs.saveData(key: "notifications", value: false);
    }
  }

  static void cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
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

  static void showScheduleNotificationForAzan({
    required int id,
    required String body,
    required int hour,
    required int minute,
  }) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      "$id",
      "High Importance Notifications",
      importance: Importance.max,
      playSound: true,
      enableVibration: true,
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        importance: Importance.max,

        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
        // sound: const RawResourceAndroidNotificationSound("azan1"),
        playSound: true,
        enableVibration: true,
        // fullScreenIntent: true,
        // channelDescription: "channelDescription",
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
      hour,
      minute,
    );
    if (scheduleTime.isBefore(currentTime)) {
      scheduleTime = scheduleTime.add(const Duration(days: 1));
    }
    log(
      "**********************************************$body*************************",
    );
    log(currentTime.day.toString());
    log(currentTime.hour.toString());
    log(currentTime.minute.toString());
    log("-----------------------------");
    log(scheduleTime.day.toString());
    log(scheduleTime.hour.toString());
    log(scheduleTime.minute.toString());
    log("++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      "وَذَكِّرْ فَإِنَّ الذِّكْرَىٰ تَنفَعُ الْمُؤْمِنِينَ",
      body,
      scheduleTime,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.alarmClock,
    );
  }

  static void showScheduleNotificationTest() async {
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        "30",
        "High Importance Notifications",
        importance: Importance.max,
        priority: Priority.high,
        icon: '@mipmap/ic_launcher',
      ),
      iOS: const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation("Africa/Cairo"));
    log("asjads");
    await flutterLocalNotificationsPlugin.zonedSchedule(
      30,
      "title",
      "body",
      tz.TZDateTime(
        tz.local,
        tz.TZDateTime.now(tz.local).year,
        tz.TZDateTime.now(tz.local).month,
        tz.TZDateTime.now(tz.local).day,
        tz.TZDateTime.now(tz.local).hour,
        tz.TZDateTime.now(tz.local).minute + 1, // Schedule for 1 minute later
      ),
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }
}
