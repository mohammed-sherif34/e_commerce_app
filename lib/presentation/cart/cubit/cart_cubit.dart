import 'package:e_commerce_app/core/utils/shared_prefrence_manager.dart';
import 'package:e_commerce_app/data/models/get_and_update_cart_model.dart';
import 'package:e_commerce_app/domain/useCases/get_logged_user_cart.dart';
import 'package:e_commerce_app/domain/useCases/remove_specific_cart_item.dart';
import 'package:e_commerce_app/domain/useCases/update_cart_product_quantity.dart';
import 'package:e_commerce_app/presentation/cart/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit(
    this._getLoggedUserCartUseCase,
    this._removeSpecificCartItemUseCase,
    this._updateCartProductQuantityUseCase,
  ) : super(CartInitialState());
  final GetLoggedUserCartUseCase? _getLoggedUserCartUseCase;
  final RemoveSpecificCartItemUseCase? _removeSpecificCartItemUseCase;
  final UpdateCartProductQuantityUseCase? _updateCartProductQuantityUseCase;
  int totalPrice = 0;
  List<Products>? productsList;
  int? itemQuantity;
  static CartCubit get(context) => BlocProvider.of(context);

  getCart() async {
    emit(GetCartLoadingState());
    var either = await _getLoggedUserCartUseCase!.call();
    either.fold((failure) {
      emit(GetCartErrState(errMsg: failure.errMessage));
    }, (response) {
      productsList = response.data!.products;
      totalPrice = (response.data!.totalCartPrice!);
      SharedPreferencesManager.saveData(
          key: 'numOfCartItems', value: response.numOfCartItems!);

      emit(GetCartSuccessState());
    });
  }

  removeCartItem(
    String productId,
  ) async {
    var either = await _removeSpecificCartItemUseCase!.call(productId);
    either.fold((failure) {
      emit(GetCartErrState(errMsg: failure.errMessage));
    }, (response) {
      productsList = response.data!.products!;
      totalPrice = response.data!.totalCartPrice!;
      SharedPreferencesManager.saveData(
          key: 'numOfCartItems', value: response.numOfCartItems!);
      emit(GetCartSuccessState());
    });
  }

  updateItemQuantity(String productId, int quantity, int index) async {
    var either =
        await _updateCartProductQuantityUseCase!.call(productId, quantity);
    either.fold((failure) {
      emit(GetCartErrState(errMsg: failure.errMessage));
    }, (response) {
      productsList = response.data!.products;
      totalPrice = response.data!.totalCartPrice!;
      emit(GetCartSuccessState());
    });
  }
}
