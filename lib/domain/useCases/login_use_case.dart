import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/data/models/user_model.dart';
import 'package:e_commerce_app/domain/repo/auth_repo.dart';

class LoginUseCase {
  AuthRepo repo;
  LoginUseCase({required this.repo});
  Future<Either<UserModel, Failure>> call(String email, String password) =>
      repo.login(email, password);
}
