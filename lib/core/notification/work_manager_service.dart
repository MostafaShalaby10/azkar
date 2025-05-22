import 'dart:developer';

import 'package:azkar/core/notification/local_notification_service.dart';
import 'package:azkar/core/utils/service_locator.dart';
import 'package:workmanager/workmanager.dart';

class WorkManagerService {
  static void registerMyTask() async {
    log("***");
    await Workmanager().registerPeriodicTask(
    
      "Azkar",
      "Azkar sabah and massa",
      frequency: const Duration(seconds: 10),
    );
    log("++++++");
  }

  Future init() async {
    await Workmanager().initialize(actionTask, isInDebugMode: true);
    registerMyTask();
    log("13513");
  }

 
  static void cancelTask() {
    getIt<Workmanager>().cancelAll();
  }
}
@pragma('vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
   void actionTask() {
    log("Out");
    Workmanager().executeTask((task, data) {
      log("In");
      LocalNotificationService.showScheduleNotificationForAzan(1, 10);
      return Future.value(true);
    });
    log("After");
  }
