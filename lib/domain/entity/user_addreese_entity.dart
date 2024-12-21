class UserAddreeseEntity {
  UserAddreeseEntity({
    this.name,
    this.details,
    this.phone,
    this.city,
  });


  String? name;
  String? details;
  String? phone;
  String? city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['details'] = details;
    map['phone'] = phone;
    map['city'] = city;
    return map;
  }
}
