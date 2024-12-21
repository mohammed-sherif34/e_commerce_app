import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/data/dataSources/remoteDataSource/favourite_remote_ds.dart';
import 'package:e_commerce_app/data/models/add_and_remove_favourite_model.dart';
import 'package:e_commerce_app/data/models/get_favourite_model.dart';
import 'package:e_commerce_app/domain/repo/favourite_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavouriteRepo)
class FavouriteRepoImpl implements FavouriteRepo {
  FavouriteRemoteDs favouriteRemoteDs;
  FavouriteRepoImpl(this.favouriteRemoteDs);
  @override
  Future<Either<Failure, AddAndRemoveFavouriteModel>> addProductToFavourite  ( 
      String productId) async {
    var either =  await favouriteRemoteDs.addProductToFavourite(productId);
      return either.fold(
        (failure) => Left(failure), (response) => Right(response));
  }

  @override
  Future<Either<Failure, GetFavouriteModel>> getLoggedUserFavourite() async{
   var either =  await favouriteRemoteDs.getLoggedUserFavourite();
      return either.fold(
        (failure) => Left(failure), (response) => Right(response));
  }

  @override
  Future<Either<Failure, AddAndRemoveFavouriteModel>>
      removeProductFromFavourite(String productId) async {
    var either =  await favouriteRemoteDs.removeProductFromFavourite(productId);
      return either.fold(
        (failure) => Left(failure), (response) => Right(response));
  }
}
