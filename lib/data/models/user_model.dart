import 'package:e_commerce_app/core/utils/constants_manager.dart';

class UserModel {
  UserModel({
    this.message,
    this.user,
    this.token,
  });

  UserModel.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map[Constants.message] = message;
    if (user != null) {
      map[Constants.user] = user?.toJson();
    }
    map[Constants.token] = token;
    return map;
  }
}

class User {
  User({
    this.name,
    this.email,
    this.role,
  });

  User.fromJson(dynamic json) {
    name = json[Constants.name];
    email = json[Constants.email];
    role = json[Constants.role];
  }
  String? name;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map[Constants.name] = name;
    map[Constants.email] = email;
    map[Constants.role] = role;
    return map;
  }
}
