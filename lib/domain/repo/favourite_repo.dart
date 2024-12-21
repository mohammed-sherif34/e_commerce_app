import 'package:dartz/dartz.dart';

import '../../core/failures/failure.dart';
import '../../data/models/add_and_remove_favourite_model.dart';
import '../../data/models/get_favourite_model.dart';

abstract class FavouriteRepo {
  Future<Either<Failure, AddAndRemoveFavouriteModel>> addProductToFavourite(
      String productId);
  Future<Either<Failure, AddAndRemoveFavouriteModel>>
      removeProductFromFavourite(String productId);
  Future<Either<Failure, GetFavouriteModel>> getLoggedUserFavourite();
}
