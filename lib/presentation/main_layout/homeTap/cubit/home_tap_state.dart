part of 'home_tap_cubit.dart';

class HomeTapState {}

class HomeTapInitial extends HomeTapState {}

class CategorisLoading extends HomeTapState {}

class CategorisFailure extends HomeTapState {
  final String errMsg;
  CategorisFailure({required this.errMsg});
}

class CategorisSuccess extends HomeTapState {
  CategorisSuccess({ required this.categorisList});
  List<CategoryOrBrand> categorisList;
}

class BrandsLoading extends HomeTapState {}

class BrandsFailure extends HomeTapState {
  final String errMsg;
  BrandsFailure({required this.errMsg});
}

class BrandsSuccess extends HomeTapState {
  BrandsSuccess({required this.brandsList});
  List<CategoryOrBrand> brandsList = [];
}
