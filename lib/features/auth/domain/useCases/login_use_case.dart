import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';

class LoginUseCase {
  AuthRepo repo;
  LoginUseCase({required this.repo});
  Future<Either<UserModel, Failure>> call(String email, String password) =>
      repo.login(email, password);
}
