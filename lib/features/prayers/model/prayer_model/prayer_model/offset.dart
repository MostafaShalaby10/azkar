class Offset {
  num? imsak;
  num? fajr;
  num? sunrise;
  num? dhuhr;
  num? asr;
  num? maghrib;
  num? sunset;
  num? isha;
  num? midnight;

  Offset({
    this.imsak,
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.sunset,
    this.isha,
    this.midnight,
  });

  factory Offset.fromJson(
    Map<String, dynamic> json,
  ) {
    return Offset(
      imsak: num.tryParse(json['Imsak'].toString()),
      fajr: num.tryParse(json['Fajr'].toString()),
      sunrise: num.tryParse(json['Sunrise'].toString()),
      dhuhr: num.tryParse(json['Dhuhr'].toString()),
      asr: num.tryParse(json['Asr'].toString()),
      maghrib: num.tryParse(json['Maghrib'].toString()),
      sunset: num.tryParse(json['Sunset'].toString()),
      isha: num.tryParse(json['Isha'].toString()),
      midnight: num.tryParse(json['Midnight'].toString()),
    );
  }

  Map<String, dynamic>
  toJson() {
    return {
      if (imsak != null) 'Imsak': imsak,
      if (fajr != null) 'Fajr': fajr,
      if (sunrise != null) 'Sunrise': sunrise,
      if (dhuhr != null) 'Dhuhr': dhuhr,
      if (asr != null) 'Asr': asr,
      if (maghrib != null) 'Maghrib': maghrib,
      if (sunset != null) 'Sunset': sunset,
      if (isha != null) 'Isha': isha,
      if (midnight != null) 'Midnight': midnight,
    };
  }
}
