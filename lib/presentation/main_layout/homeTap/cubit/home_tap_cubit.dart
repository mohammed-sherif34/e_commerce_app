import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/data/models/category_or_brand_model.dart';
import 'package:e_commerce_app/domain/useCases/all_brandes_use_case.dart';
import 'package:e_commerce_app/domain/useCases/all_categories_use_case.dart';
import 'package:injectable/injectable.dart';

part 'home_tap_state.dart';

@injectable
class HomeTapCubit extends Cubit<HomeTapState> {
  HomeTapCubit({this.allBrandasUseCase, this.allCategoriesUseCase})
      : super(HomeTapInitial());
  AllBrandesUseCase? allBrandasUseCase;
  AllCategoriesUseCase? allCategoriesUseCase;
  getAllCategories() async {
    emit(HomeTapLoading());
    var either = await allCategoriesUseCase?.call();
    either!.fold((response) {
      emit(HomeTapSuccess(categorisOrBrandList: response.data!));
    }, (failure) {
      emit(HomeTapFailure(errMsg: failure.errMessage));
    });
  }

  getAllBrands() async {
    emit(HomeTapLoading());
    var either = await allBrandasUseCase?.call();
    either!.fold((response) {
      emit(HomeTapSuccess(categorisOrBrandList: response.data!));
    }, (failure) {
      emit(HomeTapFailure(errMsg: failure.errMessage));
    });
  }
}
