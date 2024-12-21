import 'dart:convert';

import 'package:e_commerce_app/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static late SharedPreferences _sharedPreferences;

  static getInstance() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static void saveUser({required String key, required User user}) {
    String userJson = jsonEncode(user.toJson());
    _sharedPreferences.setString(key, userJson);
  }

  static User getUser(String key) {
    String userJson = _sharedPreferences.getString(key) ?? '';
    if (userJson.isNotEmpty) {
      Map<String, dynamic> userMap = jsonDecode(userJson);
      return User.fromJson(userMap);
    }
    return User(
      name: '',
    ); // Return a default user if no user found
  }

  static void saveData({required String key, required dynamic value}) {
    if (value is String) {
      _sharedPreferences.setString(key, value);
    } else if (value is int) {
      _sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      _sharedPreferences.setBool(key, value);
    } else if (value is double) {
      _sharedPreferences.setDouble(key, value);
    } else if (value is List<String>) {
      _sharedPreferences.setStringList(key, value);
    }
  }

  static dynamic getData(String key) {
    return _sharedPreferences.get(key);
  }

  static void removeData(String key) {
    _sharedPreferences.remove(key);
  }

  static void clearData() {
    _sharedPreferences.clear();
  }
}
