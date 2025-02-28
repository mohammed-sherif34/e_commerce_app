import 'package:e_commerce_app/config/di/di.dart';
import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:e_commerce_app/core/utils/shared_prefrence_manager.dart';
import 'package:e_commerce_app/core/widgets/cart_icon_button.dart';
import 'package:e_commerce_app/presentation/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/presentation/main_layout/cubit/home_view_model_cubit.dart';
import 'package:e_commerce_app/presentation/main_layout/cubit/home_view_model_state.dart';
import 'package:e_commerce_app/presentation/main_layout/productTap/cubit/product_tap_cubit.dart';
import 'package:e_commerce_app/presentation/main_layout/productTap/cubit/product_tap_state.dart';
import 'package:e_commerce_app/presentation/main_layout/widgets/custom_bottom_navigation_bar.dart';
import 'package:e_commerce_app/presentation/main_layout/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  HomeViewModelCubit viewModel = getIt.get<HomeViewModelCubit>();
  @override
  void initState() {
    CartCubit.get(context).getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModelCubit, HomeViewModelState>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: CustomBottomNavigationBar(viewModel: viewModel),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                  top: true,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(ImageAssets.routeBLogo),
                  )),
              viewModel.selectedIndex != 3
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomTextFiled(),
                        Badge(
                            alignment: Alignment.topLeft,
                            label:
                                BlocBuilder<ProductTapCubit, ProductTapState>(
                              bloc: ProductTapCubit.get(context),
                              builder: (context, state) {
                                if (state is AddToCartSuccessState) {
                                  return Text(SharedPreferencesManager.getData(
                                          'numOfCartItems')
                                      .toString());
                                }
                                return Text(SharedPreferencesManager.getData(
                                        'numOfCartItems')
                                    .toString());
                              },
                            ),
                            child: const CartIconButton()),
                      ],
                    )
                  : const SizedBox(),
              Expanded(child: viewModel.taps[viewModel.selectedIndex]),
            ],
          ),
        );
      },
    );
  }
}
