import 'package:e_commerce_app/core/utils/shared_prefrence_manager.dart';
import 'package:e_commerce_app/data/models/get_favourite_model.dart';
import 'package:e_commerce_app/domain/useCases/get_looged_user_favourite_use_case.dart';
import 'package:e_commerce_app/domain/useCases/remove_product_from_favourite_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:e_commerce_app/domain/useCases/add_product_to_cart_use_case.dart';
import 'package:e_commerce_app/domain/useCases/add_product_to_favourite_use_case.dart';
import 'package:e_commerce_app/domain/useCases/all_products_use_case.dart';
import 'package:e_commerce_app/presentation/main_layout/productTap/cubit/product_tap_state.dart';

@injectable
class ProductTapCubit extends Cubit<ProductTapState> {
  ProductTapCubit(
      this._addProductToCartUseCase,
      this._addProductToFavouriteUseCase,
      this._allProductsUseCase,
      this._removeProductFromFavouriteUseCase,
      this._getLoggedUserFavouriteUseCase)
      : super(ProductTapInitial());
  final AllProductsUseCase _allProductsUseCase;
  final AddProductToCartUseCase _addProductToCartUseCase;
  final AddProductToFavouriteUseCase _addProductToFavouriteUseCase;
  final RemoveProductFromFavouriteUseCase _removeProductFromFavouriteUseCase;
  final GetLoggedUserFavouriteUseCase _getLoggedUserFavouriteUseCase;
 
  List<GetFavouriteData> productList = [];
  static ProductTapCubit get(context) => BlocProvider.of(context);
  
  getAllProducts() async {
    emit(ProductTapLoading());
    var either = await _allProductsUseCase.call();
    either.fold((response) {
      
      emit(ProductTapSuccess(productList: response.productsList!));
    }, (failure) {
      emit(ProductTapFailure(errMsg: failure.errMessage));
    });
  }

  addProductToCart({required productId}) async {
    var either = await _addProductToCartUseCase.call(productId);
    either.fold((failure) {
      emit(AddToCartErrState(failure.errMessage));
    }, (response) {
      SharedPreferencesManager.saveData(
          key: 'numOfCartItems', value: response.numOfCartItems!);
     
      emit(AddToCartSuccessState());
    });
  }

  addProductToFavourite({required productId}) async {
    emit(FavouriteLoadingState());
    var either = await _addProductToFavouriteUseCase.call(productId);
    either.fold((failure) {
      emit(FavouriteErrState(failure.errMessage));
    }, (response) {
      emit(FavouriteSuccessState());
    });
  }

  getLoggedUserFavourite() async {
    var either = await _getLoggedUserFavouriteUseCase.call();
    either.fold((failure) {
      emit(FavouriteErrState(failure.errMessage));
    }, (response) {
      productList = response.data!;
      emit(FavouriteSuccessState());
    });
  }

  removeProductFromFavourite({
    required productId,
  }) async {
    var either = await _removeProductFromFavouriteUseCase.call(productId);
    either.fold((failure) {
      emit(FavouriteErrState(failure.errMessage));
    }, (response) {
      getLoggedUserFavourite();
      emit(FavouriteSuccessState());
    });
  }
}
