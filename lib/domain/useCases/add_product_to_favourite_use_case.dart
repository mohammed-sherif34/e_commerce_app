import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/domain/repo/favourite_repo.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/add_and_remove_favourite_model.dart';

@injectable
class AddProductToFavouriteUseCase {
  FavouriteRepo repo;
  AddProductToFavouriteUseCase(this.repo);
  Future<Either<Failure, AddAndRemoveFavouriteModel>> call(String productId) =>
      repo.addProductToFavourite(productId);
}
