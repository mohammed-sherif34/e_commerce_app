import 'package:e_commerce_app/config/di/di.dart';
import 'package:e_commerce_app/core/widgets/custom_circular_indicator.dart';
import 'package:e_commerce_app/core/widgets/custom_err_icon.dart';
import 'package:e_commerce_app/presentation/main_layout/favouriteTap/widgets/favourite_item.dart';
import 'package:e_commerce_app/presentation/main_layout/productTap/cubit/product_tap_cubit.dart';
import 'package:e_commerce_app/presentation/main_layout/productTap/cubit/product_tap_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteTapView extends StatefulWidget {
  const FavouriteTapView({super.key});

  @override
  State<FavouriteTapView> createState() => _FavouriteTapViewState();
}

class _FavouriteTapViewState extends State<FavouriteTapView> {
  late ProductTapCubit viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = getIt.get<ProductTapCubit>();
    viewModel.getLoggedUserFavourite();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<ProductTapCubit, ProductTapState>(
            bloc: viewModel,
            builder: (context, state) {
              if (state is FavouriteSuccessState) {
                return ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: viewModel.productList.length,
                    itemBuilder: (context, index) {
                      return FavouriteItem(
                        viewModel: viewModel,
                        product: viewModel.productList[index],
                      );
                    });
              } else if (state is FavouriteErrState) {
                return const CustomErrIcon();
              } else {
                return const CustomCircularIndicator();
              }
            },
          ),
        ),
      ],
    );
  }
}
