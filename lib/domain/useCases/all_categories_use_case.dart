import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/data/models/category_or_brand_model.dart';
import 'package:e_commerce_app/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AllCategoriesUseCase {
  HomeRepo repo;
  AllCategoriesUseCase(this.repo);
  Future<Either<CategoryOrBrandModel, Failure>> call() =>
      repo.getAllCategories();
}
