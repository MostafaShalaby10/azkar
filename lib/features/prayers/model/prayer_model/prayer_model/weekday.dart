class Weekday {
  String? en;
  String? ar;

  Weekday({this.en, this.ar});

  factory Weekday.fromJson(
    Map<String, dynamic> json,
  ) {
    return Weekday(en: json['en']?.toString(), ar: json['ar']?.toString());
  }

  Map<String, dynamic>
  toJson() {
    return {if (en != null) 'en': en, if (ar != null) 'ar': ar};
  }
}
