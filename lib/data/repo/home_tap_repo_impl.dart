import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/data/dataSources/remoteDataSource/home_tap_remote_ds.dart';
import 'package:e_commerce_app/data/models/category_or_brand_model.dart';
import 'package:e_commerce_app/domain/repo/home_tap_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: HomeTapRepo)
class HomeTapRepoImp implements HomeTapRepo {
  HomeTapRepoImp({required this.homeTapRemoteDs});
  HomeTapRemoteDs homeTapRemoteDs;
  @override
  Future<Either<CategoryOrBrandModel, Failure>> getAllBrands() async{
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
}
