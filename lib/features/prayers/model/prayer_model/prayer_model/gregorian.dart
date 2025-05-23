import 'designation.dart';
import 'month.dart';
import 'weekday.dart';

class Gregorian {
  String? date;
  String? format;
  String? day;
  Weekday? weekday;
  Month? month;
  String? year;
  Designation? designation;
  bool? lunarSighting;

  Gregorian({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
    this.lunarSighting,
  });

  factory Gregorian.fromJson(
    Map<String, dynamic> json,
  ) {
    return Gregorian(
      date: json['date']?.toString(),
      format: json['format']?.toString(),
      day: json['day']?.toString(),
      weekday:
          json['weekday'] == null
              ? null
              : Weekday.fromJson(
                Map<String, dynamic>.from(json['weekday']),
              ),
      month:
          json['month'] == null
              ? null
              : Month.fromJson(
                Map<String, dynamic>.from(json['month']),
              ),
      year: json['year']?.toString(),
      designation:
          json['designation'] == null
              ? null
              : Designation.fromJson(
                Map<String, dynamic>.from(json['designation']),
              ),
      lunarSighting: json['lunarSighting']?.toString().contains("true"),
    );
  }

  Map<String, dynamic>
  toJson() {
    return {
      if (date != null) 'date': date,
      if (format != null) 'format': format,
      if (day != null) 'day': day,
      if (weekday != null)
        'weekday':
            weekday
                ?.toJson(),
      if (month != null)
        'month':
            month
                ?.toJson(),
      if (year != null) 'year': year,
      if (designation != null)
        'designation':
            designation
                ?.toJson(),
      if (lunarSighting != null) 'lunarSighting': lunarSighting,
    };
  }
}
