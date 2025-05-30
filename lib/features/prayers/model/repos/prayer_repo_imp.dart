import 'dart:developer';

import 'package:azkar/core/networking/api_Service.dart';
import 'package:azkar/core/utils/shared_prefrences.dart';
import 'package:azkar/features/prayers/model/repos/prayer_repo_interface.dart';

class PrayerRepoImp implements PrayerRepoInterface {
  final ApiService _apiService;

  PrayerRepoImp(ApiService apiService) : _apiService = apiService;

  @override
  Future getPrayerTimes() async {
    return await _apiService
        .getResponse(
          latitude: await SharedPrefs.getData(key: "latitude")??30.56566577691538,
          longitude: await SharedPrefs.getData(key: "longitude")?? 31.023629517778776,
        )
        .then((value) {
          return value;
        })
        .catchError((error) {
          log(error.toString());
        });
  }
}
