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
            appBar: AppBar(
              title: const CustomTextWidget(
                text: "Notification Settings",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
            ),
            body:
                state is CheckNotificationState
                    ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 30.h),
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
                                SizedBox(height: 20.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                                    .changeTimeOfEveningNotification(
                                                      value,
                                                    );
                                              }
                                            })
                                            .catchError((error) {});
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                            .3,
                                        height: 100.h,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(
                                                0.25,
                                              ),
                                              spreadRadius: 0,
                                              blurRadius: 5,
                                              offset: const Offset(0, 0),
                                            ),
                                          ],
                                          border: Border.all(
                                            color: Colors.grey.withOpacity(0.5),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10.r,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.nights_stay_sharp,
                                              color: Colors.blue,
                                              size: 30.r,
                                            ),
                                            const CustomTextWidget(
                                              text: "اذكار المساء",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            CustomTextWidget(
                                              text:
                                                  "${notificationCubit.eveningMinute} : ${notificationCubit.eveningHour}",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
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
                                            .catchError((error) {});
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                            .3,
                                        height: 100.h,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(
                                                0.25,
                                              ),
                                              spreadRadius: 0,
                                              blurRadius: 5,
                                              offset: const Offset(0, 0),
                                            ),
                                          ],
                                          border: Border.all(
                                            color: Colors.grey.withOpacity(0.5),
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10.r,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.sunny,
                                              color: Colors.yellow,
                                              size: 30.r,
                                            ),
                                            const CustomTextWidget(
                                              text: "اذكار الصباح",
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            CustomTextWidget(
                                              text:
                                                  "${notificationCubit.morningMinute} : ${notificationCubit.morningHour}",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                          SizedBox(height: 20.h),
                          const Center(
                            child: CustomTextWidget(
                              textAlign: TextAlign.center,
                              text:
                                  "يارب تشتغل في شركه كبيره يا مصطفى يا حبيبي😘",
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              textColor: Colors.blue,
                            ),
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
