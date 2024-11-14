import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/data/models/user_model.dart';
import 'package:e_commerce_app/domain/entity/sign_up_data.dart';

abstract class AuthRepo {
  Future<Either<UserModel, Failure>> login(String email, String password);
  Future<Either<UserModel, Failure>> signUp(SignUpData entity);
  Future<bool> forgetPassword();
}
