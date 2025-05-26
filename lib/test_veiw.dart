import 'package:azkar/core/notification/local_notification_service.dart';
import 'package:azkar/core/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtonWidget(
              text: "Click",
              onPressed: () {
                LocalNotificationService.showScheduleNotificationTest();
              },
            ),
          ],
        ),
      ),
    );
  }
}
