import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/get_and_update_cart_model.dart';
import '../repo/cart_repo.dart';

@injectable
class RemoveSpecificCartItemUseCase {
  CartRepo repo;
  RemoveSpecificCartItemUseCase(this.repo);
  Future<Either<Failure, GetAndUpdateCartModel>> call(productId) =>
      repo.removeSpecificCartItem(productId);
}
