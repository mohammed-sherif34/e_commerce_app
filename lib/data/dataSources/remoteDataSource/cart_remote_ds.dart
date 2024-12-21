import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/data/models/add_to_cart_model.dart';
import 'package:e_commerce_app/data/models/get_and_update_cart_model.dart';

abstract class CartRemoteDs {
  Future<Either<Failure, AddToCartModel>> addProductToCart(String productId);
  Future<Either<Failure, GetAndUpdateCartModel>> getLoggedUserCart();
  Future<Either<Failure, GetAndUpdateCartModel>> updateCartProductQuantity(
      String productId, int quantity);
  Future<Either<Failure, GetAndUpdateCartModel>> removeSpecificCartItem(
      String productId);
}
