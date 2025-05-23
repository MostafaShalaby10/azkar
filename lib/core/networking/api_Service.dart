import 'package:dio/dio.dart';
import 'package:location/location.dart';

import 'api_constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future getResponse({required LocationData location }) async {
    return await _dio.get(
      "$baseURL$date",
      queryParameters: {
        "latitude": location.latitude,
        "longitude": location.longitude,
      },
    );
  }
}
