import 'date.dart';
import 'meta.dart';
import 'timings.dart';

class Data {
  Timings? timings;
  Date? date;
  Meta? meta;

  Data({this.timings, this.date, this.meta});

  factory Data.fromJson(
    Map<String, dynamic> json,
  ) {
    return Data(
      timings:
          json['timings'] == null
              ? null
              : Timings.fromJson(
                Map<String, dynamic>.from(json['timings']),
              ),
      date:
          json['date'] == null
              ? null
              : Date.fromJson(
                Map<String, dynamic>.from(json['date']),
              ),
      meta:
          json['meta'] == null
              ? null
              : Meta.fromJson(
                Map<String, dynamic>.from(json['meta']),
              ),
    );
  }

  Map<String, dynamic>
  toJson() {
    return {
      if (timings != null)
        'timings':
            timings
                ?.toJson(),
      if (date != null)
        'date':
            date?.toJson(),
      if (meta != null)
        'meta':
            meta?.toJson(),
    };
  }
}
