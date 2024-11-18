// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../core/api/api_manager.dart' as _i1057;
import '../../data/dataSources/remoteDataSource/auth_remote_ds.dart' as _i563;
import '../../data/dataSources/remoteDataSource/auth_remote_ds_imp.dart'
    as _i21;
import '../../data/dataSources/remoteDataSource/home_remote_ds.dart' as _i27;
import '../../data/dataSources/remoteDataSource/home_remote_ds_imp.dart'
    as _i1031;
import '../../data/repo/auth_repo_impl.dart' as _i0;
import '../../data/repo/home_repo_impl.dart' as _i330;
import '../../domain/repo/auth_repo.dart' as _i716;
import '../../domain/repo/home_repo.dart' as _i645;
import '../../domain/useCases/all_brandas_use_case.dart' as _i324;
import '../../domain/useCases/all_categories_use_case.dart' as _i249;
import '../../domain/useCases/all_products_use_case.dart' as _i704;
import '../../domain/useCases/login_use_case.dart' as _i546;
import '../../domain/useCases/sign_up_use_case.dart' as _i550;
import '../../presentation/auth/cubit/auth_cubit.dart' as _i1063;
import '../../presentation/main_layout/cubit/home_view_model_cubit.dart'
    as _i982;
import '../../presentation/main_layout/homeTap/cubit/home_tap_cubit.dart'
    as _i778;
import '../../presentation/main_layout/productTap/cubit/product_tap_cubit.dart'
    as _i792;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i1057.ApiManager>(() => _i1057.ApiManager());
    gh.factory<_i982.HomeViewModelCubit>(() => _i982.HomeViewModelCubit());
    gh.factory<_i792.ProductTapCubit>(() => _i792.ProductTapCubit(
        allProductsUseCase: gh<_i704.AllProductsUseCase>()));
    gh.factory<_i1063.AuthCubit>(() => _i1063.AuthCubit(
          signUpUseCase: gh<_i550.SignUpUseCase>(),
          loginUseCase: gh<_i546.LoginUseCase>(),
        ));
    gh.factory<_i563.AuthRemoteDs>(
        () => _i21.AuthRemoteDsImp(gh<_i1057.ApiManager>()));
    gh.factory<_i778.HomeTapCubit>(() => _i778.HomeTapCubit(
          allBrandasUseCase: gh<_i324.AllBrandasUseCase>(),
          allCategoriesUseCase: gh<_i249.AllCategoriesUseCase>(),
        ));
    gh.factory<_i27.HomeRemoteDs>(
        () => _i1031.HomeRemoteDataSourceImpl(gh<_i1057.ApiManager>()));
    gh.factory<_i716.AuthRepo>(
        () => _i0.AuthRepoImpl(gh<_i563.AuthRemoteDs>()));
    gh.factory<_i645.HomeRepo>(
        () => _i330.HomeRepoImp(homeTapRemoteDs: gh<_i27.HomeRemoteDs>()));
    gh.factory<_i546.LoginUseCase>(
        () => _i546.LoginUseCase(repo: gh<_i716.AuthRepo>()));
    gh.factory<_i550.SignUpUseCase>(
        () => _i550.SignUpUseCase(repo: gh<_i716.AuthRepo>()));
    gh.factory<_i324.AllBrandasUseCase>(
        () => _i324.AllBrandasUseCase(gh<_i645.HomeRepo>()));
    gh.factory<_i249.AllCategoriesUseCase>(
        () => _i249.AllCategoriesUseCase(gh<_i645.HomeRepo>()));
    gh.factory<_i704.AllProductsUseCase>(
        () => _i704.AllProductsUseCase(gh<_i645.HomeRepo>()));
    return this;
  }
}
