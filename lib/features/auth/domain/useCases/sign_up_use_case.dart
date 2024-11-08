import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/auth/domain/entity/sign_up_data.dart';
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';

class SignUpUseCase {
  AuthRepo repo;
  SignUpUseCase({required this.repo});
  Future<Either<UserModel, Failure>> call(SignUpData entity) => repo.signUp(entity);
}
