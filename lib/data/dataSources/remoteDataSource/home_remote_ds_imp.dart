import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/api/api_manager.dart';
import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/core/utils/constants_manager.dart';
import 'package:e_commerce_app/data/dataSources/remoteDataSource/home_remote_ds.dart';
import 'package:e_commerce_app/data/models/category_or_brand_model.dart';
import 'package:e_commerce_app/data/models/product_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDs)
class HomeRemoteDataSourceImpl implements HomeRemoteDs {
  late ApiManager apiManager;
  HomeRemoteDataSourceImpl(this.apiManager);
  @override
  Future<Either<CategoryOrBrandModel, Failure>> getAllBrands() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      try {
        var response = await apiManager
            .get(endPoint: EndPoints.brands, param: {'limit': 50});
        var brandResponse = CategoryOrBrandModel.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! <= 300) {
          return Left(brandResponse);
        } else {
          return Right(Failure(errMessage: brandResponse.message!));
        }
      } on Exception catch (e) {
        return Right(Failure(errMessage: e.toString()));
      }
    } else {
      return Right(NetworkErr(errMessage: Constants.checkInternet));
    }
  }

  @override
  Future<Either<CategoryOrBrandModel, Failure>> getAllCategories() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      try {
        var response = await apiManager.get(
          endPoint: EndPoints.categories,
        );
        var categoryResponse = CategoryOrBrandModel.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! <= 300) {
          return Left(categoryResponse);
        } else {
          print(categoryResponse.message!);
          return Right(Failure(errMessage: categoryResponse.message!));
        }
      } on Exception catch (e) {
        print(e.toString());
        return Right(Failure(errMessage: e.toString()));
      }
    } else {
      return Right(NetworkErr(errMessage: Constants.checkInternet));
    }
  }

  @override
  Future<Either<ProductModel, Failure>> getAllProducts() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      try {
        var response = await apiManager.get(
          endPoint: EndPoints.products,
        );
        var productResponse = ProductModel.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! <= 300) {
          return Left(productResponse);
        } else {
          print(productResponse.message!);
          return Right(Failure(errMessage: productResponse.message!));
        }
      } on Exception catch (e) {
        print(e.toString());
        return Right(Failure(errMessage: e.toString()));
      }
    } else {
      return Right(NetworkErr(errMessage: Constants.checkInternet));
    }
  }
}
