abstract class CartState {}


final class CartInitialState extends CartState {}

final class GetCartLoadingState extends CartState {}

final class GetCartSuccessState extends CartState {
}

final class GetCartErrState extends CartState {
  final String errMsg;

  GetCartErrState({required this.errMsg});
}




