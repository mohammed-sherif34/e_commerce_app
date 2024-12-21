import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/data/dataSources/remoteDataSource/favourite_remote_ds.dart';
import 'package:e_commerce_app/data/models/add_and_remove_favourite_model.dart';
import 'package:e_commerce_app/data/models/get_favourite_model.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api/api_manager.dart';
import '../../../core/api/end_points.dart';
import '../../../core/api/status_code.dart';
import '../../../core/utils/constants_manager.dart';
import '../../../core/utils/shared_prefrence_manager.dart';

@Injectable(as: FavouriteRemoteDs)
class FavouriteRemoteDsImpl implements FavouriteRemoteDs {
  String token = SharedPreferencesManager.getData('token');
  FavouriteRemoteDsImpl(this.apiManager);
  late ApiManager apiManager;
  @override
  Future<Either<Failure, AddAndRemoveFavouriteModel>> addProductToFavourite(
      String productId) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      try {
        var response = await apiManager.post(
            headers: {'token': token},
            endPoint: EndPoints.favourite,
            body: {"productId": productId});
        AddAndRemoveFavouriteModel favouriteResponse =
            AddAndRemoveFavouriteModel.fromJson(response.data);
        if (response.statusCode! >= StatusCodes.success &&
            response.statusCode! <= StatusCodes.failure) {
          return Right(favouriteResponse);
        } else {
          return Left(ServerErr(errMessage: favouriteResponse.message!));
        }
      } on Exception catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      return Left(NetworkErr(errMessage: Constants.checkInternet));
    }
  }

  @override
  Future<Either<Failure, GetFavouriteModel>> getLoggedUserFavourite() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      try {
        var response = await apiManager
            .get(headers: {'token': token}, endPoint: EndPoints.favourite);
        GetFavouriteModel favouriteResponse =
            GetFavouriteModel.fromJson(response.data);
        if (response.statusCode! >= StatusCodes.success &&
            response.statusCode! <= StatusCodes.failure) {
          return Right(favouriteResponse);
        } else {
          return Left(ServerErr(errMessage: favouriteResponse.message!));
        }
      } on Exception catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      return Left(NetworkErr(errMessage: Constants.checkInternet));
    }
  }

  @override
  Future<Either<Failure, AddAndRemoveFavouriteModel>>
      removeProductFromFavourite(String productId) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      try {
        var response = await apiManager.delete(
          headers: {'token': token},
          endPoint: '${EndPoints.favourite}/$productId',
        );
        AddAndRemoveFavouriteModel cartResponse =
            AddAndRemoveFavouriteModel.fromJson(response.data);
        if (response.statusCode! >= StatusCodes.success &&
            response.statusCode! <= StatusCodes.failure) {
          return Right(cartResponse);
        } else {
          return Left(ServerErr(errMessage: cartResponse.message!));
        }
      } on Exception catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      return Left(NetworkErr(errMessage: Constants.checkInternet));
    }
  }
}
