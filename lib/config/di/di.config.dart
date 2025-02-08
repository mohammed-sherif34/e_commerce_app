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
import '../../core/utils/strip_services.dart' as _i653;
import '../../data/dataSources/remoteDataSource/auth_remote_ds.dart' as _i563;
import '../../data/dataSources/remoteDataSource/auth_remote_ds_imp.dart'
    as _i21;
import '../../data/dataSources/remoteDataSource/cart_remote_ds.dart' as _i579;
import '../../data/dataSources/remoteDataSource/cart_remote_ds_impl.dart'
    as _i676;
import '../../data/dataSources/remoteDataSource/checkout_remote_ds.dart'
    as _i650;
import '../../data/dataSources/remoteDataSource/checkout_remote_ds_imp.dart'
    as _i1007;
import '../../data/dataSources/remoteDataSource/favourite_remote_ds.dart'
    as _i515;
import '../../data/dataSources/remoteDataSource/favourite_remote_ds_impl.dart'
    as _i471;
import '../../data/dataSources/remoteDataSource/home_remote_ds.dart' as _i27;
import '../../data/dataSources/remoteDataSource/home_remote_ds_imp.dart'
    as _i1031;
import '../../data/dataSources/remoteDataSource/profile_remote_data_source.dart'
    as _i142;
import '../../data/dataSources/remoteDataSource/profile_remote_data_source_impl.dart'
    as _i303;
import '../../data/repo/auth_repo_impl.dart' as _i0;
import '../../data/repo/cart_repo_impl.dart' as _i818;
import '../../data/repo/checkout_repo_impl.dart' as _i202;
import '../../data/repo/favourite_repo_impl.dart' as _i594;
import '../../data/repo/home_repo_impl.dart' as _i330;
import '../../data/repo/profile_repo_impl.dart' as _i767;
import '../../domain/repo/auth_repo.dart' as _i716;
import '../../domain/repo/cart_repo.dart' as _i985;
import '../../domain/repo/checkout_repo.dart' as _i695;
import '../../domain/repo/favourite_repo.dart' as _i808;
import '../../domain/repo/home_repo.dart' as _i645;
import '../../domain/repo/profile_repo.dart' as _i851;
import '../../domain/useCases/add_product_to_cart_use_case.dart' as _i407;
import '../../domain/useCases/add_product_to_favourite_use_case.dart' as _i858;
import '../../domain/useCases/add_user_address_use_case.dart' as _i550;
import '../../domain/useCases/all_brandes_use_case.dart' as _i946;
import '../../domain/useCases/all_categories_use_case.dart' as _i249;
import '../../domain/useCases/all_products_use_case.dart' as _i704;
import '../../domain/useCases/get_logged_user_cart.dart' as _i129;
import '../../domain/useCases/get_looged_user_favourite_use_case.dart' as _i286;
import '../../domain/useCases/get_user_address_use_case.dart' as _i752;
import '../../domain/useCases/login_use_case.dart' as _i546;
import '../../domain/useCases/make_payment_use_case.dart' as _i82;
import '../../domain/useCases/remove_product_from_favourite_use_case.dart'
    as _i283;
import '../../domain/useCases/remove_specific_cart_item.dart' as _i88;
import '../../domain/useCases/sign_up_use_case.dart' as _i550;
import '../../domain/useCases/update_cart_product_quantity.dart' as _i190;
import '../../presentation/auth/cubit/auth_cubit.dart' as _i1063;
import '../../presentation/cart/cubit/cart_cubit.dart' as _i314;
import '../../presentation/cart/payment/cubit/payment_cubit.dart' as _i581;
import '../../presentation/main_layout/cubit/home_view_model_cubit.dart'
    as _i982;
import '../../presentation/main_layout/homeTap/cubit/home_tap_cubit.dart'
    as _i778;
import '../../presentation/main_layout/productTap/cubit/product_tap_cubit.dart'
    as _i792;
import '../../presentation/main_layout/profileTap/cubit/profile_cubit.dart'
    as _i698;

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
    gh.factory<_i778.HomeTapCubit>(() => _i778.HomeTapCubit(
          allBrandasUseCase: gh<_i946.AllBrandesUseCase>(),
          allCategoriesUseCase: gh<_i249.AllCategoriesUseCase>(),
        ));
    gh.factory<_i653.StripServices>(
        () => _i653.StripServices(gh<_i1057.ApiManager>()));
    gh.factory<_i314.CartCubit>(() => _i314.CartCubit(
          gh<_i129.GetLoggedUserCartUseCase>(),
          gh<_i88.RemoveSpecificCartItemUseCase>(),
          gh<_i190.UpdateCartProductQuantityUseCase>(),
        ));
    gh.factory<_i1063.AuthCubit>(() => _i1063.AuthCubit(
          signUpUseCase: gh<_i550.SignUpUseCase>(),
          loginUseCase: gh<_i546.LoginUseCase>(),
        ));
    gh.factory<_i563.AuthRemoteDs>(
        () => _i21.AuthRemoteDsImp(gh<_i1057.ApiManager>()));
    gh.factory<_i579.CartRemoteDs>(
        () => _i676.CartRemoteDsImpl(gh<_i1057.ApiManager>()));
    gh.factory<_i985.CartRepo>(
        () => _i818.CartRepoImpl(gh<_i579.CartRemoteDs>()));
    gh.factory<_i650.CheckoutRemoteDs>(
        () => _i1007.CheckoutRemoteDsImp(gh<_i653.StripServices>()));
    gh.factory<_i695.CheckoutRepo>(
        () => _i202.CheckoutRepoImpl(gh<_i650.CheckoutRemoteDs>()));
    gh.factory<_i27.HomeRemoteDs>(
        () => _i1031.HomeRemoteDataSourceImpl(gh<_i1057.ApiManager>()));
    gh.factory<_i82.MakePaymentUseCase>(
        () => _i82.MakePaymentUseCase(gh<_i695.CheckoutRepo>()));
    gh.factory<_i142.ProfileRemoteDs>(
        () => _i303.ProfileRemoteDsImpl(gh<_i1057.ApiManager>()));
    gh.factory<_i581.PaymentCubit>(
        () => _i581.PaymentCubit(gh<_i82.MakePaymentUseCase>()));
    gh.factory<_i515.FavouriteRemoteDs>(
        () => _i471.FavouriteRemoteDsImpl(gh<_i1057.ApiManager>()));
    gh.factory<_i716.AuthRepo>(
        () => _i0.AuthRepoImpl(gh<_i563.AuthRemoteDs>()));
    gh.factory<_i808.FavouriteRepo>(
        () => _i594.FavouriteRepoImpl(gh<_i515.FavouriteRemoteDs>()));
    gh.factory<_i851.ProfileRipo>(
        () => _i767.ProfileRepoImpl(gh<_i142.ProfileRemoteDs>()));
    gh.factory<_i645.HomeRepo>(
        () => _i330.HomeRepoImp(homeTapRemoteDs: gh<_i27.HomeRemoteDs>()));
    gh.factory<_i546.LoginUseCase>(
        () => _i546.LoginUseCase(repo: gh<_i716.AuthRepo>()));
    gh.factory<_i550.SignUpUseCase>(
        () => _i550.SignUpUseCase(repo: gh<_i716.AuthRepo>()));
    gh.factory<_i407.AddProductToCartUseCase>(
        () => _i407.AddProductToCartUseCase(gh<_i985.CartRepo>()));
    gh.factory<_i129.GetLoggedUserCartUseCase>(
        () => _i129.GetLoggedUserCartUseCase(gh<_i985.CartRepo>()));
    gh.factory<_i88.RemoveSpecificCartItemUseCase>(
        () => _i88.RemoveSpecificCartItemUseCase(gh<_i985.CartRepo>()));
    gh.factory<_i190.UpdateCartProductQuantityUseCase>(
        () => _i190.UpdateCartProductQuantityUseCase(gh<_i985.CartRepo>()));
    gh.factory<_i858.AddProductToFavouriteUseCase>(
        () => _i858.AddProductToFavouriteUseCase(gh<_i808.FavouriteRepo>()));
    gh.factory<_i286.GetLoggedUserFavouriteUseCase>(
        () => _i286.GetLoggedUserFavouriteUseCase(gh<_i808.FavouriteRepo>()));
    gh.factory<_i283.RemoveProductFromFavouriteUseCase>(() =>
        _i283.RemoveProductFromFavouriteUseCase(gh<_i808.FavouriteRepo>()));
    gh.factory<_i550.AddUserAddressUseCase>(
        () => _i550.AddUserAddressUseCase(gh<_i851.ProfileRipo>()));
    gh.factory<_i752.GetLoggedUserAddresseUseCase>(
        () => _i752.GetLoggedUserAddresseUseCase(gh<_i851.ProfileRipo>()));
    gh.factory<_i946.AllBrandesUseCase>(
        () => _i946.AllBrandesUseCase(gh<_i645.HomeRepo>()));
    gh.factory<_i249.AllCategoriesUseCase>(
        () => _i249.AllCategoriesUseCase(gh<_i645.HomeRepo>()));
    gh.factory<_i704.AllProductsUseCase>(
        () => _i704.AllProductsUseCase(gh<_i645.HomeRepo>()));
    gh.factory<_i792.ProductTapCubit>(() => _i792.ProductTapCubit(
          gh<_i407.AddProductToCartUseCase>(),
          gh<_i858.AddProductToFavouriteUseCase>(),
          gh<_i704.AllProductsUseCase>(),
          gh<_i283.RemoveProductFromFavouriteUseCase>(),
          gh<_i286.GetLoggedUserFavouriteUseCase>(),
        ));
    gh.factory<_i698.ProfileCubit>(() => _i698.ProfileCubit(
          gh<_i752.GetLoggedUserAddresseUseCase>(),
          gh<_i550.AddUserAddressUseCase>(),
        ));
    return this;
  }
}
