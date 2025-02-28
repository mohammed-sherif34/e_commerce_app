import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/data/models/product_model.dart';
import 'package:e_commerce_app/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AllProductsUseCase {
  HomeRepo repo;
  AllProductsUseCase(this.repo);
  Future<Either<ProductModel, Failure>> call() => repo.getAllProducts();
}
