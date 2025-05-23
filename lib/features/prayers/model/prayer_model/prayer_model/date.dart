import 'gregorian.dart';
import 'hijri.dart';

class Date {
  String? readable;
  String? timestamp;
  Hijri? hijri;
  Gregorian? gregorian;

  Date({this.readable, this.timestamp, this.hijri, this.gregorian});

  factory Date.fromJson(
    Map<String, dynamic> json,
  ) {
    return Date(
      readable: json['readable']?.toString(),
      timestamp: json['timestamp']?.toString(),
      hijri:
          json['hijri'] == null
              ? null
              : Hijri.fromJson(
                Map<String, dynamic>.from(json['hijri']),
              ),
      gregorian:
          json['gregorian'] == null
              ? null
              : Gregorian.fromJson(
                Map<String, dynamic>.from(json['gregorian']),
              ),
    );
  }

  Map<String, dynamic>
  toJson() {
    return {
      if (readable != null) 'readable': readable,
      if (timestamp != null) 'timestamp': timestamp,
      if (hijri != null)
        'hijri':
            hijri
                ?.toJson(),
      if (gregorian != null)
        'gregorian':
            gregorian
                ?.toJson(),
    };
  }
}
