import 'package:azkar/core/notification/local_notification_service.dart';
import 'package:azkar/core/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            CustomButtonWidget(
              text: "Click",
              onPressed: () {
                // LocalNotificationService.showScheduleNotification(5 ,5);
                LocalNotificationService.showScheduleNotificationForAzan(
                  15,
                  15,
                );
                // LocalNotificationService.showScheduleNotification(25,25);
              },
            ),
          ],
        ),
      ),
    );
  }
}
