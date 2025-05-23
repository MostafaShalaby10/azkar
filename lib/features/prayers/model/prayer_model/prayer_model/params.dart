class Params {
  num? fajr;
  num? isha;

  Params({this.fajr, this.isha});

  factory Params.fromJson(
    Map<String, dynamic> json,
  ) {
    return Params(
      fajr: num.tryParse(json['Fajr'].toString()),
      isha: num.tryParse(json['Isha'].toString()),
    );
  }

  Map<String, dynamic>
  toJson() {
    return {if (fajr != null) 'Fajr': fajr, if (isha != null) 'Isha': isha};
  }
}
