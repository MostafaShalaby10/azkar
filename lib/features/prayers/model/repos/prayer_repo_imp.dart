import 'package:azkar/core/networking/api_Service.dart';
import 'package:azkar/features/prayers/model/repos/prayer_repo_interface.dart';
import 'package:location/location.dart';

class PrayerRepoImp implements PrayerRepoInterface {
  final ApiService _apiService;

  PrayerRepoImp(ApiService apiService) : _apiService = apiService;

  @override
  Future getPrayerTimes() async {
    return await _apiService.getResponse(location: await getUserLocation());
  }

  @override
  Future<LocationData> getUserLocation() async {
    return await Location.instance.getLocation();
  }
}
