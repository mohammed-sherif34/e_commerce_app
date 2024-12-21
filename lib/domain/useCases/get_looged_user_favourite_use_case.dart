import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/domain/repo/favourite_repo.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/get_favourite_model.dart';

@injectable
class GetLoggedUserFavouriteUseCase {
  FavouriteRepo repo;
  GetLoggedUserFavouriteUseCase(this.repo);
  Future<Either<Failure, GetFavouriteModel>> call() =>
      repo.getLoggedUserFavourite();
}
