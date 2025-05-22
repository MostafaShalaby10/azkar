import 'package:azkar/core/notification/local_notification_service.dart';
import 'package:azkar/core/notification/work_manager_service.dart';
import 'package:azkar/core/utils/hive_service.dart';
import 'package:azkar/features/azkar/view/azkar_view.dart';
import 'package:azkar/features/home/view/home_view.dart';
import 'package:azkar/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/service_locator.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // Make status bar transparent
      statusBarIconBrightness:
          Brightness.dark, // Choose icon color (light or dark)
    ),
  );
  setup();

  Future.wait([
    WorkManagerService().init() , 
      LocalNotificationService.init(), 
      HiveService.init(),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,

      builder:
          (context, child) => MaterialApp(
            theme: ThemeData(),
            debugShowCheckedModeBanner: false,
            home: child,
          ),
      child: const TestView(),
    );
  }
}
