import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/get_and_update_cart_model.dart';
import '../repo/cart_repo.dart';

@injectable
class UpdateCartProductQuantityUseCase {
  CartRepo repo;
  UpdateCartProductQuantityUseCase(this.repo);
  Future<Either<Failure, GetAndUpdateCartModel>> call(String productId,int quantity) =>
      repo.updateCartProductQuantity(productId, quantity);
}
