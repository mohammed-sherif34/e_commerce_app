import 'package:e_commerce_app/core/utils/constants_manager.dart';

class SignUpData {
  String email;
  String password;
  String rePassword;
  String userName;
  String phone;

  SignUpData({
    required this.email,
    required this.password,
    required this.rePassword,
    required this.userName,
    required this.phone,
  });

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      Constants.email: email,
      Constants.password: password,
      Constants.rePassword: rePassword,
      Constants.name: userName,
      Constants.phone: phone,
    };
  }
}
