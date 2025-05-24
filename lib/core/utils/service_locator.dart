import 'package:azkar/features/azkar/model/azkar_repo_imp.dart';
import 'package:azkar/features/prayers/model/repos/prayer_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:workmanager/workmanager.dart';

import '../../features/sebha/model/sebha_repo_imp.dart';
import '../networking/api_Service.dart';
import 'hive_service.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => ApiService(getIt<Dio>()));
  getIt.registerLazySingleton(() => HiveService());
  getIt.registerLazySingleton(() => AzkarRepoImp());
  getIt.registerLazySingleton(() => Workmanager());
  getIt.registerLazySingleton(() => PrayerRepoImp(getIt<ApiService>()));
  getIt.registerLazySingleton(() => SebhaRepoImp(getIt<HiveService>()));
  // getIt.registerLazySingleton<PrayerRepoImp>(() => PrayerRepoImp(getIt<ApiService>()));

}
