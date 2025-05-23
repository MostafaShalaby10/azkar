class Month {
  num? number;
  String? en;
  String? ar;
  num? days;

  Month({this.number, this.en, this.ar, this.days});

  factory Month.fromJson(
    Map<String, dynamic> json,
  ) {
    return Month(
      number: num.tryParse(json['number'].toString()),
      en: json['en']?.toString(),
      ar: json['ar']?.toString(),
      days: num.tryParse(json['days'].toString()),
    );
  }

  Map<String, dynamic>
  toJson() {
    return {
      if (number != null) 'number': number,
      if (en != null) 'en': en,
      if (ar != null) 'ar': ar,
      if (days != null) 'days': days,
    };
  }
}
