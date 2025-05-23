import 'dart:developer';

import 'package:azkar/core/widgets/custom_text_widget.dart';
import 'package:azkar/features/notification/model_view/cubit/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationCubit()..checkNotification(),
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          var notificationCubit = NotificationCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body:
                state is CheckNotificationState
                    ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const CustomTextWidget(
                                text: "Notification",
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                              const Spacer(),
                              FlutterSwitch(
                                width: 60.w,
                                height: 30.h,
                                valueFontSize: 14.0,
                                toggleSize: 15,
                                value: notificationCubit.toogleValue,
                                borderRadius: 30.0,
                                padding: 8.0,
                                showOnOff: false,
                                onToggle: (val) {
                                  notificationCubit.changeToogleValue();
                                },
                              ),
                            ],
                          ),
                          if (notificationCubit.toogleValue)
                            Column(
                              spacing: 20.h,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        )
                                        .then((value) {
                                          if (value != null) {
                                            notificationCubit
                                                .changeTimeOfMorningNotification(
                                                  value,
                                                );
                                          }
                                        })
                                        .catchError((error) {
                                          log(error.toString());
                                        });
                                  },
                                  child: Row(
                                    children: [
                                      CustomTextWidget(
                                        text:
                                            "${notificationCubit.morningMinute} : ${notificationCubit.morningHour}",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      const Spacer(),
                                      const CustomTextWidget(
                                        text: "اذكار الصباح",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () async{
                                      await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay.now(),
                                        )
                                        .then((value) {
                                            if (value != null) {
                                              notificationCubit.changeTimeOfEveningNotification(value);
                                            }
                                        })
                                        .catchError((error) {
                                          log(error.toString());
                                        });
                                  },
                                  child: Row(
                                    children: [
                                      CustomTextWidget(
                                        text:
                                            "${notificationCubit.eveningMinute} : ${notificationCubit.eveningHour}",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      const Spacer(),
                                      const CustomTextWidget(
                                        text: "اذكار المساء",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    )
                    : const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
