import 'dart:developer';
import 'package:azkar/core/notification/work_manager_service.dart';
import 'package:azkar/core/utils/hive_service.dart';
import 'package:azkar/features/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:location/location.dart';
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
  await SharedPrefs.init();
  // await getUserLocation();
  Future.delayed(const Duration(seconds: 5));
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

Future<void> getUserLocation() async {
  Location location = Location();

  bool serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      debugPrint('Location service not enabled');
      return;
    }
  }

  PermissionStatus permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      debugPrint('Location permission not granted');
      return;
    }
  }

  try {
    LocationData locationData = await location.getLocation();
    await SharedPrefs.saveData(key: "lat", value: locationData.latitude);
    await SharedPrefs.saveData(key: "lng", value: locationData.longitude);
    log("lat: ${locationData.latitude}");
    log("lng: ${locationData.longitude}");
  } catch (e) {
    debugPrint('Error fetching location: $e');
  }
}
