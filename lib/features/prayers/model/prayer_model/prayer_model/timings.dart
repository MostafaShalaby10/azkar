class Timings {
  String? fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? sunset;
  String? maghrib;
  String? isha;
  String? imsak;
  String? midnight;
  String? firstthird;
  String? lastthird;

  Timings({
    this.fajr,
    this.sunrise,
    this.dhuhr,
    this.asr,
    this.sunset,
    this.maghrib,
    this.isha,
    this.imsak,
    this.midnight,
    this.firstthird,
    this.lastthird,
  });

  factory Timings.fromJson(
    Map<String, dynamic> json,
  ) {
    return Timings(
      fajr: json['Fajr']?.toString(),
      sunrise: json['Sunrise']?.toString(),
      dhuhr: json['Dhuhr']?.toString(),
      asr: json['Asr']?.toString(),
      sunset: json['Sunset']?.toString(),
      maghrib: json['Maghrib']?.toString(),
      isha: json['Isha']?.toString(),
      imsak: json['Imsak']?.toString(),
      midnight: json['Midnight']?.toString(),
      firstthird: json['Firstthird']?.toString(),
      lastthird: json['Lastthird']?.toString(),
    );
  }

  Map<String, dynamic>
  toJson() {
    return {
      if (fajr != null) 'Fajr': fajr,
      if (sunrise != null) 'Sunrise': sunrise,
      if (dhuhr != null) 'Dhuhr': dhuhr,
      if (asr != null) 'Asr': asr,
      if (sunset != null) 'Sunset': sunset,
      if (maghrib != null) 'Maghrib': maghrib,
      if (isha != null) 'Isha': isha,
      if (imsak != null) 'Imsak': imsak,
      if (midnight != null) 'Midnight': midnight,
      if (firstthird != null) 'Firstthird': firstthird,
      if (lastthird != null) 'Lastthird': lastthird,
    };
  }
}
