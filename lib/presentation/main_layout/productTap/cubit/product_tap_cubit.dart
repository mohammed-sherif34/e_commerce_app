import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/useCases/all_products_use_case.dart';
import 'package:e_commerce_app/presentation/main_layout/productTap/cubit/product_tap_state.dart';
import 'package:injectable/injectable.dart';
@injectable
class ProductTapCubit extends Cubit<ProductTapState> {
  ProductTapCubit({this.allProductsUseCase}) : super(ProductTapInitial());
  AllProductsUseCase? allProductsUseCase;
  getAllProducts() async {
    emit(ProductTapLoading());
    var either = await allProductsUseCase?.call();
    either?.fold((response) {
      emit(ProductTapSuccess(productList: response.productsList!));
    }, (failure) {
      emit(ProductTapFailure(errMsg: failure.errMessage));
    });
  }
}
