class GetLoggedUserAddressModel {
  GetLoggedUserAddressModel({
    this.results,
    this.status,
    this.data,
  });

  GetLoggedUserAddressModel.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];

    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  int? results;
  String? status;
  List<Data>? data;
  String? message;
}

class Data {
  Data({
    this.id,
    this.name,
    this.details,
    this.phone,
    this.city,
  });

  Data.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    details = json['details'];
    phone = json['phone'];
    city = json['city'];
  }
  String? id;
  String? name;
  String? details;
  String? phone;
  String? city;
}
