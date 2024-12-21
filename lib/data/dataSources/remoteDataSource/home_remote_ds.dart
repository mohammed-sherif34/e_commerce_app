import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/data/models/category_or_brand_model.dart';
import 'package:e_commerce_app/data/models/product_model.dart';

abstract class HomeRemoteDs {
  Future<Either<CategoryOrBrandModel, Failure>> getAllCategories();
  Future<Either<CategoryOrBrandModel, Failure>> getAllBrands();
  Future<Either<ProductModel, Failure>> getAllProducts();
}
