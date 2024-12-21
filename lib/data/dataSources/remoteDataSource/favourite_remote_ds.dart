import 'package:dartz/dartz.dart';

import '../../../core/failures/failure.dart';
import '../../models/add_and_remove_favourite_model.dart';
import '../../models/get_favourite_model.dart';

abstract class FavouriteRemoteDs {
  Future<Either<Failure, AddAndRemoveFavouriteModel>> addProductToFavourite(
      String productId);
  Future<Either<Failure, AddAndRemoveFavouriteModel>>
      removeProductFromFavourite(String productId);
  Future<Either<Failure, GetFavouriteModel>> getLoggedUserFavourite();
}
