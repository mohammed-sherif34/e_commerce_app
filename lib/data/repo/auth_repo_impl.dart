import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/data/dataSources/remoteDataSource/auth_remote_ds.dart';
import 'package:e_commerce_app/data/models/user_model.dart';
import 'package:e_commerce_app/domain/entity/sign_up_data.dart';
import 'package:e_commerce_app/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl(
    this.authRemoteDs,
  );
  AuthRemoteDs authRemoteDs;
  @override
  Future<bool> forgetPassword() {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<UserModel, Failure>> login(
      String email, String password) async {
    var either = await authRemoteDs.login(email, password);
    return either.fold((response) {
      return left(response);
    }, (failure) {
      return right(failure);
    });
  }

  @override
  Future<Either<UserModel, Failure>> signUp(SignUpData entity) async {
    var either = await authRemoteDs.signUp(entity);
    return either.fold((response) {
      return left(response);
    }, (failure) {
      return right(failure);
    });
  }
}
