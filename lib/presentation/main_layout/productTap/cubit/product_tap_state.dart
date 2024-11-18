
import 'package:e_commerce_app/data/models/product_model.dart';

abstract class ProductTapState {}

final class ProductTapInitial extends ProductTapState {}
class ProductTapLoading extends ProductTapState {}

class ProductTapFailure extends ProductTapState {
  final String errMsg;
  ProductTapFailure({required this.errMsg});
}

class ProductTapSuccess extends ProductTapState {
  ProductTapSuccess({required this.productList});
  List<Product> productList;
}
