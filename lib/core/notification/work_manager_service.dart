import 'dart:developer';

import 'package:azkar/core/notification/local_notification_service.dart';
import 'package:azkar/core/utils/shared_prefrences.dart';
import 'package:azkar/features/prayers/model/repos/prayer_repo_imp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';
import 'package:timezone/data/latest.dart' as tz;
import '../utils/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';


class WorkManagerService {
  void registerMyTask() async {
    await Workmanager().registerPeriodicTask(
      "Azkar",
      "Azkar sabah and massa",
      frequency: const Duration(hours: 23),
      constraints: Constraints(networkType: NetworkType.connected),
    );
  }

  Future init() async {
    await LocalNotificationService.init();
    await Workmanager().initialize(actionTask, isInDebugMode: !kReleaseMode);
    registerMyTask();
  }

  static void cancelTask() {
    LocalNotificationService.cancelNotification();
    getIt<Workmanager>().cancelAll();
  }
}

@pragma(
  'vm:entry-point',
) // Mandatory if the App is obfuscated or using Flutter 3.1+
void actionTask() {
  Workmanager().executeTask((task, data) async {
    // LocalNotificationService.showScheduleNotificationForAzan(1, 10);
    WidgetsFlutterBinding.ensureInitialized();
    // DartPluginRegistrant.ensureInitialized();
    await SharedPrefs.init(); // <-- Add this line

    setupServiceLocator();


    await addNotificationsForAzan();
    await addNotificationForAzkar();
    return Future.value(true);
  });
}

Future addNotificationsForAzan() async {
  await getIt<PrayerRepoImp>()
      .getPrayerTimes()
      .then((value) {
        LocalNotificationService.showScheduleNotificationForAzan(
          id: 1,
          body: "صلاه الفجر",
          hour: int.parse(
            value.data["data"]["timings"]['Fajr'].split(":").first,
          ),
          minute: int.parse(
            value.data["data"]["timings"]['Fajr'].split(":").last,
          ),
        );
        LocalNotificationService.showScheduleNotificationForAzan(
          id: 2,
          body: "صلاه الظهر",
          hour: int.parse(
            value.data["data"]["timings"]['Dhuhr'].split(":").first,
          ),
          minute: int.parse(
            value.data["data"]["timings"]['Dhuhr'].split(":").last,
          ),
        );
        LocalNotificationService.showScheduleNotificationForAzan(
          id: 3,
          body: "صلاه العصر",
          hour: int.parse(
            value.data["data"]["timings"]['Asr'].split(":").first,
          ),
          minute: int.parse(
            value.data["data"]["timings"]['Asr'].split(":").last,
          ),
        );
        LocalNotificationService.showScheduleNotificationForAzan(
          id: 4,
          body: "صلاه المغرب",
          hour: int.parse(
            value.data["data"]["timings"]['Maghrib'].split(":").first,
          ),
          minute: int.parse(
            value.data["data"]["timings"]['Maghrib'].split(":").last,
          ),
        );
        LocalNotificationService.showScheduleNotificationForAzan(
          id: 5,
          body: "صلاه العشاء",
          hour: int.parse(
            value.data["data"]["timings"]['Isha'].split(":").first,
          ),
          minute: int.parse(
            value.data["data"]["timings"]['Isha'].split(":").last,
          ),
        );
      })
      .catchError((error) {
        log(error.toString());
      });
}

Future addNotificationForAzkar() async {
  LocalNotificationService.showScheduleNotificationForAzkar(
    id: 10,
    body: " اذكار الصباح",
    hour: await SharedPrefs.getData(key: "morningHour") ?? 7,
    minute: await SharedPrefs.getData(key: "morningMinutes") ?? 0,
  );
  LocalNotificationService.showScheduleNotificationForAzkar(
    id: 11,
    body: " اذكار المساء",
    hour: await SharedPrefs.getData(key: "eveningHour") ?? 19,
    minute: await SharedPrefs.getData(key: "eveningMinutes") ?? 0,
  );
}
