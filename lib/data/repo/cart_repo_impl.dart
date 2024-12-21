import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/data/dataSources/remoteDataSource/cart_remote_ds.dart';
import 'package:e_commerce_app/data/models/add_to_cart_model.dart';
import 'package:e_commerce_app/data/models/get_and_update_cart_model.dart';
import 'package:e_commerce_app/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CartRepo)
class CartRepoImpl implements CartRepo {
  CartRemoteDs cartRemoteDs;
  CartRepoImpl(this.cartRemoteDs);
  @override
  Future<Either<Failure, AddToCartModel>> addProductToCart(
      String productId) async {
    var either = await cartRemoteDs.addProductToCart(productId);
    return either.fold(
        (failure) => Left(failure), (response) => Right(response));
  }

  @override
  Future<Either<Failure, GetAndUpdateCartModel>> getLoggedUserCart() async {
    var either = await cartRemoteDs.getLoggedUserCart();
    return either.fold(
        (failure) => Left(failure), (response) => Right(response));
  }

  @override
  Future<Either<Failure, GetAndUpdateCartModel>> removeSpecificCartItem(
      String productId) async {
    var either = await cartRemoteDs.removeSpecificCartItem(productId);
    return either.fold(
        (failure) => Left(failure), (response) => Right(response));
  }

  @override
  Future<Either<Failure, GetAndUpdateCartModel>> updateCartProductQuantity(
      String productId, int quantity) async {
    var either =
        await cartRemoteDs.updateCartProductQuantity(productId, quantity);
    return either.fold(
        (failure) => Left(failure), (response) => Right(response));
  }
}
