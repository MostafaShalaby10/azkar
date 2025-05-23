import 'location.dart';
import 'params.dart';

class Method {
  num? id;
  String? name;
  Params? params;
  Location? location;

  Method({this.id, this.name, this.params, this.location});

  factory Method.fromJson(
    Map<String, dynamic> json,
  ) {
    return Method(
      id: num.tryParse(json['id'].toString()),
      name: json['name']?.toString(),
      params:
          json['params'] == null
              ? null
              : Params.fromJson(
                Map<String, dynamic>.from(json['params']),
              ),
      location:
          json['location'] == null
              ? null
              : Location.fromJson(
                Map<String, dynamic>.from(json['location']),
              ),
    );
  }

  Map<String, dynamic>
  toJson() {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (params != null)
        'params':
            params
                ?.toJson(),
      if (location != null)
        'location':
            location
                ?.toJson(),
    };
  }
}
