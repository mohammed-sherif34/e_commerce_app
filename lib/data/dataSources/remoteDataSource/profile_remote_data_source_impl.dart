import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/api/api_manager.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/api/status_code.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/core/utils/constants_manager.dart';
import 'package:e_commerce_app/core/utils/shared_prefrence_manager.dart';
import 'package:e_commerce_app/data/dataSources/remoteDataSource/profile_remote_data_source.dart';
import 'package:e_commerce_app/data/models/add_address_model.dart';
import 'package:e_commerce_app/data/models/get_logged_user_address_model.dart';
import 'package:e_commerce_app/domain/entity/user_addreese_entity.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProfileRemoteDs)
class ProfileRemoteDsImpl implements ProfileRemoteDs {
  ProfileRemoteDsImpl(this.apiManager);
  ApiManager apiManager;
  String token = SharedPreferencesManager.getData('token');
  @override
  Future<Either<Failure, AddAddressModel>> addAddress(
      UserAddreeseEntity userAddreeseEntity) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      try {
        var response = await apiManager.post(
            headers: {'token': token},
            endPoint: EndPoints.addressPost,
            body: userAddreeseEntity.toJson() );
        AddAddressModel postAddressResponse = AddAddressModel.fromJson(response.data);
        if (response.statusCode! >= StatusCodes.success &&
            response.statusCode! <= StatusCodes.failure) {
          return Right(postAddressResponse);
        } else {
          return Left(ServerErr(errMessage: postAddressResponse.message!));
        }
      } on Exception catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      return Left(NetworkErr(errMessage: Constants.checkInternet));
    }
  }

  @override
  Future<Either<Failure, GetLoggedUserAddressModel>>
      getLoggedUserAddresse() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      try {
        var response = await apiManager
            .get(headers: {'token': token}, endPoint: EndPoints.addressGet);
        GetLoggedUserAddressModel getAddressResponse =
            GetLoggedUserAddressModel.fromJson(response.data);
        if (response.statusCode! >= StatusCodes.success &&
            response.statusCode! <= StatusCodes.failure) {
          return Right(getAddressResponse);
        } else {
          return Left(ServerErr(errMessage: getAddressResponse.message!));
        }
      } on Exception catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      return Left(NetworkErr(errMessage: Constants.checkInternet));
    }
  }
}
