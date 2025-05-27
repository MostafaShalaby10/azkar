import 'package:azkar/core/notification/work_manager_service.dart';
import 'package:azkar/core/utils/shared_prefrences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/notification/local_notification_service.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());
  static NotificationCubit get(context) => BlocProvider.of(context);

  bool toogleValue = false;

  Future checkNotification() async {
    if (await SharedPrefs.getData(key: "notifications")) {
      toogleValue = true;
      getTimeNotification();
      emit(CheckNotificationState());
    } else if (await Permission.notification.isGranted) {
      toogleValue = false;
      emit(CheckNotificationState());
    } else {
      getPermission();
    }
  }

  void changeToogleValue() async {
    if (await Permission.notification.isGranted) {
      toogleValue = !toogleValue;
      if (!toogleValue) {
        WorkManagerService.cancelTask();
      } else {
        await WorkManagerService().init();
        getTimeNotification();
      }

      await SharedPrefs.saveData(key: "notifications", value: toogleValue);
      emit(CheckNotificationState());
    } else {
      getPermission();
    }
  }

  Future getPermission() async {
    await Permission.notification.request().then((value) {
      if (value.isGranted) {
        SharedPrefs.saveData(key: "notifications", value: true);
        toogleValue = true;
        emit(CheckNotificationState());
      } else {
        toogleValue = false;
        emit(CheckNotificationState());
      }
    });
  }

  int morningHour = 0;
  int eveningHour = 0;
  int morningMinute = 0;
  int eveningMinute = 0;
  Future getTimeNotification() async {
    eveningHour = await SharedPrefs.getData(key: "eveningHour") ?? 19;
    eveningMinute = await SharedPrefs.getData(key: "eveningMinutes") ?? 00;
    morningHour = await SharedPrefs.getData(key: "morningHour") ?? 7;
    morningMinute = await SharedPrefs.getData(key: "morningMinutes") ?? 00;
    // emit(GetNotificationTimeState());
  }

  Future changeTimeOfMorningNotification(TimeOfDay time) async {
    await SharedPrefs.saveData(key: "morningHour", value: time.hour);
    await SharedPrefs.saveData(key: "morningMinutes", value: time.minute);
    morningHour = time.hour;
    morningMinute = time.minute;
    LocalNotificationService.showScheduleNotificationForAzkar(
      id: 10,
      body: "اذكار الصباح",
      hour: await SharedPrefs.getData(key: "morningHour"),
      minute: await SharedPrefs.getData(key: "morningMinutes"),
    );
    emit(CheckNotificationState());
  }

  Future changeTimeOfEveningNotification(TimeOfDay time) async {
    await SharedPrefs.saveData(key: "eveningHour", value: time.hour);
    await SharedPrefs.saveData(key: "eveningMinutes", value: time.minute);
    eveningHour = time.hour;
    eveningMinute = time.minute;
    LocalNotificationService.showScheduleNotificationForAzkar(
      id: 11,
      body: "اذكار المساء",
      hour: await SharedPrefs.getData(key: "eveningHour"),
      minute: await SharedPrefs.getData(key: "eveningMinutes"),
    );
    emit(CheckNotificationState());
  }
}
