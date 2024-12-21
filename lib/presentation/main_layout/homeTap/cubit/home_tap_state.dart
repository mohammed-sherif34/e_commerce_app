part of 'home_tap_cubit.dart';

class HomeTapState {}

class HomeTapInitial extends HomeTapState {}

class HomeTapLoading extends HomeTapState {}

class HomeTapFailure extends HomeTapState {
  final String errMsg;
  HomeTapFailure({required this.errMsg});
}

class HomeTapSuccess extends HomeTapState {
  HomeTapSuccess({required this.categorisOrBrandList});
  List<CategoryOrBrand> categorisOrBrandList;
}
