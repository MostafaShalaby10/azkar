import 'dart:developer';

import 'package:dio/dio.dart';

import 'api_constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future getResponse({required double latitude, required double longitude}) async {
    return await _dio.get(
      "$baseURL$date",
      queryParameters: {
        "latitude": latitude,
        "longitude": longitude,
      },
    ).catchError((error)
     {
      log(error.toString());

    });
  }
}
