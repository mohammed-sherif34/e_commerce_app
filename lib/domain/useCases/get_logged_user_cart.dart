import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/get_and_update_cart_model.dart';

@injectable
class GetLoggedUserCartUseCase {
  CartRepo repo;
  GetLoggedUserCartUseCase(this.repo);
  Future<Either<Failure, GetAndUpdateCartModel>> call() =>
      repo.getLoggedUserCart();
}
