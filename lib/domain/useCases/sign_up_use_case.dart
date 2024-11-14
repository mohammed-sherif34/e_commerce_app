import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/data/models/user_model.dart';
import 'package:e_commerce_app/domain/entity/sign_up_data.dart';
import 'package:e_commerce_app/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUseCase {
  AuthRepo repo;
  SignUpUseCase({required this.repo});
  Future<Either<UserModel, Failure>> call(SignUpData entity) =>
      repo.signUp(entity);
}
