class Location {
  num? latitude;
  num? longitude;

  Location({this.latitude, this.longitude});

  factory Location.fromJson(
    Map<String, dynamic> json,
  ) {
    return Location(
      latitude: num.tryParse(json['latitude'].toString()),
      longitude: num.tryParse(json['longitude'].toString()),
    );
  }

  Map<String, dynamic>
  toJson() {
    return {
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
    };
  }
}
