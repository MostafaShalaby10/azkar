import 'package:azkar/core/notification/work_manager_service.dart';
import 'package:azkar/core/utils/hive_service.dart';
import 'package:azkar/features/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/utils/service_locator.dart';
import 'core/utils/shared_prefrences.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // Make status bar transparent
      statusBarIconBrightness:
          Brightness.dark, // Choose icon color (light or dark)
    ),
  );
  setupServiceLocator();
  // await getUserLocation();
    await SharedPrefs.init();


  Future.wait([
    WorkManagerService().init(),
    // LocalNotificationService.init(),
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
            title: 'Azkar App',

            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent,
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle.dark,
              ),
              scaffoldBackgroundColor: Colors.white,
            ),
            debugShowCheckedModeBanner: false,
            home: child,
          ),
      child: const HomeView(),
    );
  }
}

