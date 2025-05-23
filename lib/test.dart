// import 'package:animated_toggle_switch/animated_toggle_switch.dart';
// import 'package:azkar/core/notification/local_notification_service.dart';
// import 'package:azkar/core/utils/shared_prefrences.dart';
// import 'package:azkar/core/widgets/custom_button_widget.dart';
// import 'package:flutter/material.dart';

// class TestView extends StatefulWidget {
//   const TestView({super.key});

//   @override
//   State<TestView> createState() => _TestViewState();
// }

// class _TestViewState extends State<TestView> {
//   int value = 0;

//   @override
//   Widget build(BuildContext context) {
//     {
//       return Scaffold(
//         appBar: AppBar(),
//         body: Center(
//           child: Column(
//             children: [
//               CustomButtonWidget(
//                 text: "Click",
//                 onPressed: () async {
//                   var timer = await showTimePicker(
//                     context: context,
//                     initialTime: TimeOfDay.now(),
//                   );
//                   // log(timer!.hour.toString());
//                   await SharedPrefs.saveData(key: "hour", value: timer!.hour);
//                   await SharedPrefs.saveData(
//                     key: "minutes",
//                     value: timer.minute,
//                   );

//                   LocalNotificationService.showScheduleNotificationForAzan(
//                     id: 10,
//                     body: "Hello",
//                     hour: await SharedPrefs.getData(key: "hour"),
//                     minute: await SharedPrefs.getData(key: "minutes"),
//                   );
//                 },
//                 //                   // // LocalNotificationService.showScheduleNotification(5 ,5);
//                 //                   // LocalNotificationService.showScheduleNotificationForAzan(
//                 //                   //   15,
//                 //                   //   15,
//                 //                   // );
//                 //                   // LocalNotificationService.showScheduleNotification(25,25);
//                 //                   // context.read<PrayerCubit>().getTimes();
//                 // // LocalNotificationService.showScheduleNotificationForAzan(1, 10);
//                 //      getIt<PrayerRepoImp>().getPrayerTimes().then((value) {
//                 //       LocalNotificationService.showScheduleNotificationForAzan(
//                 //         id: 1,
//                 //         body: "صلاه الفجر",
//                 //         hour: int.parse(value.data["data"]["timings"]['Fajr'].split(":").first),
//                 //         minute: int.parse(
//                 //           value.data["data"]["timings"]['Fajr'].split(":").last,
//                 //         ),
//                 //       );
//                 //       LocalNotificationService.showScheduleNotificationForAzan(
//                 //         id: 2,
//                 //         body: "صلاه الظهر",
//                 //         hour: int.parse(
//                 //           value.data["data"]["timings"]['Dhuhr'].split(":").first,
//                 //         ),
//                 //         minute: int.parse(
//                 //           value.data["data"]["timings"]['Dhuhr'].split(":").last,
//                 //         ),
//                 //       );
//                 //       LocalNotificationService.showScheduleNotificationForAzan(
//                 //         id: 3,
//                 //         body: "صلاه العصر",
//                 //         hour: int.parse(value.data["data"]["timings"]['Asr'].split(":").first),
//                 //         minute: int.parse(value.data["data"]["timings"]['Asr'].split(":").last),
//                 //       );
//                 //       LocalNotificationService.showScheduleNotificationForAzan(
//                 //         id: 4,
//                 //         body: "صلاه المغرب",
//                 //         hour: int.parse(
//                 //           value.data["data"]["timings"]['Maghrib'].split(":").first,
//                 //         ),
//                 //         minute: int.parse(
//                 //           value.data["data"]["timings"]['Maghrib'].split(":").last,
//                 //         ),
//                 //       );
//                 //       LocalNotificationService.showScheduleNotificationForAzan(
//                 //         id: 5,
//                 //         body: "صلاه العشاء",
//                 //         hour: int.parse(value.data["data"]["timings"]['Isha'].split(":").first),
//                 //         minute: int.parse(
//                 //           value.data["data"]["timings"]['Isha'].split(":").last,
//                 //         ),
//                 //       );
//                 //     });
//                 //                   },
//               ),

//               AnimatedToggleSwitch<int>.rolling(
//                 current: value,
//                 values: [0, 1],
//                 iconsTappable: true,
//                 height: 40,
//                 indicatorSize: Size(35, 35),
//                 borderWidth: 1,
//                 padding: EdgeInsets.all(2),
//                 spacing: 0,
//                 onChanged: (i) => setState(() => value = i),
//                 styleBuilder:
//                     (value) => ToggleStyle(
//                       indicatorColor:
//                           value.isEven ? Colors.grey[400] : Colors.green,
//                     ),
//               ), // indicatorColor changes and animates its value with the selection
//               // iconList: [...], you can use iconBuilder, customIconBuilder or iconList
//               // styleBuilder: (value) => ToggleStyle(indicatorColor: value.isEven ? Colors.yellow : Colors.green), // indicatorColor changes and animates its value with the selection
//             ],
//           ),
//         ),
//       );
//     }
//   }
// }

import 'dart:developer';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:azkar/core/utils/shared_prefrences.dart';
import 'package:azkar/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings.dbjsa({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
   int value = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // value = await SharedPrefs.getData(key: "notifications")==true?1:0;
    dynamic status = getNotificationState();
    log(status.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              //notifications
              children: [
                CustomTextWidget(
                  text: "Notifications",
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
                Spacer(),
                AnimatedToggleSwitch<int>.rolling(
                  current: value,
                  values: [0, 1],
                  iconsTappable: true,
                  height: 40,
                  indicatorSize: Size(35, 35),
                  borderWidth: 1,
                  padding: EdgeInsets.all(2),
                  spacing: 0,
                  onChanged: (i) => setState(() => value = i),
                  styleBuilder:
                      (value) => ToggleStyle(
                        indicatorColor:
                            value.isEven ? Colors.grey[400] : Colors.green,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool> getNotificationState() async {
  return await Permission.notification.isGranted;
}
