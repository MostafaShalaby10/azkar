class Designation {
  String? abbreviated;
  String? expanded;

  Designation({this.abbreviated, this.expanded});

  factory Designation.fromJson(
    Map<String, dynamic> json,
  ) {
    return Designation(
      abbreviated: json['abbreviated']?.toString(),
      expanded: json['expanded']?.toString(),
    );
  }

  Map<String, dynamic>
  toJson() {
    return {
      if (abbreviated != null) 'abbreviated': abbreviated,
      if (expanded != null) 'expanded': expanded,
    };
  }
}
