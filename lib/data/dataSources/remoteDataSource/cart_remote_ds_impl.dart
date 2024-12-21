import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/api/api_manager.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/api/status_code.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/core/utils/constants_manager.dart';
import 'package:e_commerce_app/core/utils/shared_prefrence_manager.dart';
import 'package:e_commerce_app/data/models/add_to_cart_model.dart';
import 'package:e_commerce_app/data/models/get_and_update_cart_model.dart';
import 'package:injectable/injectable.dart';

import 'cart_remote_ds.dart';

@Injectable(as: CartRemoteDs)
class CartRemoteDsImpl implements CartRemoteDs {
  String token = SharedPreferencesManager.getData('token');
  CartRemoteDsImpl(this.apiManager);
  late ApiManager apiManager;

  @override
  Future<Either<Failure, AddToCartModel>> addProductToCart(
      String productId) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      try {
        var response = await apiManager.post(
            headers: {'token': token},
            endPoint: EndPoints.cart,
            body: {"productId": productId.toString()});
        AddToCartModel cartResponse = AddToCartModel.fromJson(response.data);
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

  @override
  Future<Either<Failure, GetAndUpdateCartModel>> getLoggedUserCart() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      try {
        var response = await apiManager
            .get(headers: {'token': token}, endPoint: EndPoints.cart);
        GetAndUpdateCartModel cartResponse =
            GetAndUpdateCartModel.fromJson(response.data);
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

  @override
  Future<Either<Failure, GetAndUpdateCartModel>> removeSpecificCartItem(
      String productId) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      try {
        var response = await apiManager.delete(
          headers: {'token': token},
          endPoint: '${EndPoints.cart}/$productId',
        );
        GetAndUpdateCartModel cartResponse =
            GetAndUpdateCartModel.fromJson(response.data);
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

  @override
  Future<Either<Failure, GetAndUpdateCartModel>> updateCartProductQuantity(
      String productId, int quantity) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      try {
        var response = await apiManager.put(
            headers: {'token': token},
            endPoint: '${EndPoints.cart}/$productId',
            body: {
              "count": quantity.toString(),
            });
        GetAndUpdateCartModel cartResponse =
            GetAndUpdateCartModel.fromJson(response.data);
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
