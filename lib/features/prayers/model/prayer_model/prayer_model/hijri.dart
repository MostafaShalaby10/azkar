import 'designation.dart';
import 'month.dart';
import 'weekday.dart';

class Hijri {
  String? date;
  String? format;
  String? day;
  Weekday? weekday;
  Month? month;
  String? year;
  Designation? designation;
  List<dynamic>? holidays;
  List<dynamic>? adjustedHolidays;
  String? method;

  Hijri({
    this.date,
    this.format,
    this.day,
    this.weekday,
    this.month,
    this.year,
    this.designation,
    this.holidays,
    this.adjustedHolidays,
    this.method,
  });

  factory Hijri.fromJson(
    Map<String, dynamic> json,
  ) {
    return Hijri(
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
      holidays: List<dynamic>.from(json['holidays'] ?? []),
      adjustedHolidays: List<dynamic>.from(json['adjustedHolidays'] ?? []),
      method: json['method']?.toString(),
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
      if (holidays != null) 'holidays': holidays,
      if (adjustedHolidays != null) 'adjustedHolidays': adjustedHolidays,
      if (method != null) 'method': method,
    };
  }
}
