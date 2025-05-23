import 'method.dart';
import 'offset.dart';

class Meta {
  num? latitude;
  num? longitude;
  String? timezone;
  Method? method;
  String? latitudeAdjustmentMethod;
  String? midnightMode;
  String? school;
  Offset? offset;

  Meta({
    this.latitude,
    this.longitude,
    this.timezone,
    this.method,
    this.latitudeAdjustmentMethod,
    this.midnightMode,
    this.school,
    this.offset,
  });

  factory Meta.fromJson(
    Map<String, dynamic> json,
  ) {
    return Meta(
      latitude: num.tryParse(json['latitude'].toString()),
      longitude: num.tryParse(json['longitude'].toString()),
      timezone: json['timezone']?.toString(),
      method:
          json['method'] == null
              ? null
              : Method.fromJson(
                Map<String, dynamic>.from(json['method']),
              ),
      latitudeAdjustmentMethod: json['latitudeAdjustmentMethod']?.toString(),
      midnightMode: json['midnightMode']?.toString(),
      school: json['school']?.toString(),
      offset:
          json['offset'] == null
              ? null
              : Offset.fromJson(
                Map<String, dynamic>.from(json['offset']),
              ),
    );
  }

  Map<String, dynamic>
  toJson() {
    return {
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (timezone != null) 'timezone': timezone,
      if (method != null)
        'method':
            method
                ?.toJson(),
      if (latitudeAdjustmentMethod != null)
        'latitudeAdjustmentMethod': latitudeAdjustmentMethod,
      if (midnightMode != null) 'midnightMode': midnightMode,
      if (school != null) 'school': school,
      if (offset != null)
        'offset':
            offset
                ?.toJson(),
    };
  }
}
