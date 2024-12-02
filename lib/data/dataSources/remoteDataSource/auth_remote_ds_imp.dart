import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/api/api_manager.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/core/utils/constants_manager.dart';
import 'package:e_commerce_app/core/utils/shared_prefrence_manager.dart';
import 'package:e_commerce_app/data/dataSources/remoteDataSource/auth_remote_ds.dart';
import 'package:e_commerce_app/data/models/user_model.dart';
import 'package:e_commerce_app/domain/entity/sign_up_data.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDs)
class AuthRemoteDsImp implements AuthRemoteDs {
  AuthRemoteDsImp(this.apiManager);
  late ApiManager apiManager;

  @override
  Future<Either<UserModel, Failure>> signUp(SignUpData entity) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      try {
        var response = await apiManager.post(
            endPoint: EndPoints.signup, body: entity.toJson());
        var signupResponse = UserModel.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Left(signupResponse);
        } else {
          return Right(ServerErr(errMessage: signupResponse.message!));
        }
      } on Exception catch (e) {
        return Right(Failure(errMessage: e.toString()));
      }
    } else {
      return Right(ServerErr(errMessage: Constants.checkInternet));
    }
  }

  @override
  Future<Either<UserModel, Failure>> login(
      String email, String password) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      try {
        var response = await apiManager.post(
          endPoint: EndPoints.login,
          body: {
            Constants.email: email,
            Constants.password: password,
          },
        );
        var loginResponse = UserModel.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          SharedPreferencesManager.saveUser(
              key: 'myUser', user: loginResponse.user!);
          SharedPreferencesManager.saveData(
              key: 'token', value: loginResponse.token);
              
          return Left(loginResponse);
        } else {
          return Right(ServerErr(errMessage: loginResponse.message!));
        }
      } on Exception catch (e) {
        return Right(Failure(errMessage: e.toString()));
      }
    } else {
      return Right(ServerErr(errMessage: Constants.checkInternet));
    }
  }
}
