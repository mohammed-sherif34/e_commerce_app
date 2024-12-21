import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/add_to_cart_model.dart';
import '../repo/cart_repo.dart';

@injectable
class AddProductToCartUseCase {
  CartRepo repo;
  AddProductToCartUseCase(this.repo);
  Future<Either<Failure, AddToCartModel>> call(productId) =>
      repo.addProductToCart(productId);
}
