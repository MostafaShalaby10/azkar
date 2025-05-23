import 'data.dart';

class PrayerModel {
  num? code;
  String? status;
  Data? data;

  PrayerModel({this.code, this.status, this.data});

  factory PrayerModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return PrayerModel(
      code: num.tryParse(json['code'].toString()),
      status: json['status']?.toString(),
      data:
          json['data'] == null
              ? null
              : Data.fromJson(
                Map<String, dynamic>.from(json['data']),
              ),
    );
  }

  Map<String, dynamic>
  toJson() {
    return {
      if (code != null) 'code': code,
      if (status != null) 'status': status,
      if (data != null)
        'data':
            data?.toJson(),
    };
  }
}
