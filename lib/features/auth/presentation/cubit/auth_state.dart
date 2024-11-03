import 'package:e_commerce_app/features/auth/data/models/user_model.dart';

abstract class AuthState {}

final class AuthInitialState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthSuccessState extends AuthState {
  UserModel model;
  AuthSuccessState(this.model);
}

final class AuthErrState extends AuthState {
  String errMsg;
  AuthErrState(this.errMsg);
}
