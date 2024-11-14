import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/failures/failure.dart';
import 'package:e_commerce_app/data/models/category_or_brand_model.dart';

abstract class HomeTapRepo {
  Future <Either<CategoryOrBrandModel,Failure>>getAllCategories();
  Future<Either<CategoryOrBrandModel, Failure>> getAllBrands();
}