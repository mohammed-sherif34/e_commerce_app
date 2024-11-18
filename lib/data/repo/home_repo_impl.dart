import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/data/dataSources/remoteDataSource/home_remote_ds.dart';
import 'package:e_commerce_app/data/models/category_or_brand_model.dart';
import 'package:e_commerce_app/data/models/product_model.dart';
import 'package:e_commerce_app/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImp implements HomeRepo {
  HomeRepoImp({required this.homeTapRemoteDs});
  HomeRemoteDs homeTapRemoteDs;
  @override
  Future<Either<CategoryOrBrandModel, Failure>> getAllBrands() async {
    var either = await homeTapRemoteDs.getAllBrands();
    return either.fold(
        (response) => Left(response), (failure) => Right(failure));
  }

  @override
  Future<Either<CategoryOrBrandModel, Failure>> getAllCategories() async {
    var either = await homeTapRemoteDs.getAllCategories();
    return either.fold(
        (response) => Left(response), (failure) => Right(failure));
  }

  @override
  Future<Either<ProductModel, Failure>> getAllProducts() async {
    var either = await homeTapRemoteDs.getAllProducts();
    return either.fold(
        (response) => Left(response), (failure) => Right(failure));
  }
}
