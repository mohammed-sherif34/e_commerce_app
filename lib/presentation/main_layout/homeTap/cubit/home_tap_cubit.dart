import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/data/models/category_or_brand_model.dart';
import 'package:e_commerce_app/domain/useCases/all_brandas_use_case.dart';
import 'package:e_commerce_app/domain/useCases/all_categories_use_case.dart';
import 'package:injectable/injectable.dart';

part 'home_tap_state.dart';
@injectable
class HomeTapCubit extends Cubit<HomeTapState> {
  HomeTapCubit({this.allBrandasUseCase, this.allCategoriesUseCase})
      : super(HomeTapInitial());
  AllBrandasUseCase? allBrandasUseCase;
  AllCategoriesUseCase? allCategoriesUseCase;
  getAllCategories() async {
    emit(CategorisLoading());
    var either = await allCategoriesUseCase?.call();
    either!.fold((response) {
      emit(CategorisSuccess(categorisList: response.data!));
    }, (failure) {
      emit(CategorisFailure(errMsg: failure.errMessage));
    });
  }

  getAllBrands() async {
    emit(BrandsLoading());
    var either = await allBrandasUseCase?.call();
    either!.fold((response) {
      emit(BrandsSuccess(brandsList: response.data!));
    }, (failure) {
      emit(BrandsFailure(errMsg: failure.errMessage));
    });
  }
}
