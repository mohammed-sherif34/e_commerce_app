import 'package:e_commerce_app/config/di/di.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/core/utils/snackbar_utils.dart';
import 'package:e_commerce_app/core/widgets/custom_circular_indicator.dart';
import 'package:e_commerce_app/core/widgets/custom_err_icon.dart';
import 'package:e_commerce_app/presentation/main_layout/productTap/cubit/product_tap_cubit.dart';
import 'package:e_commerce_app/presentation/main_layout/productTap/cubit/product_tap_state.dart';
import 'package:e_commerce_app/presentation/main_layout/productTap/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsTapView extends StatefulWidget {
  const ProductsTapView({super.key});

  @override
  State<ProductsTapView> createState() => _ProductsTapViewState();
}

class _ProductsTapViewState extends State<ProductsTapView> {
  ProductTapCubit viewModel = getIt.get<ProductTapCubit>();
  @override
  void initState() {
    viewModel.getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocConsumer<ProductTapCubit, ProductTapState>(
          bloc: viewModel,
          listener: (context, state) {
            if (state is ProductTapFailure) {
              SnackBarUtils.showSnackBar(
                context: context,
                text: state.errMsg,
                seconds: 3,
              );
            }
          },
          builder: (context, state) {
            if (state is ProductTapSuccess) {
              return Expanded(
                child: GridView.builder(
                  itemCount: state.productList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 300.h,
                      mainAxisSpacing: ConstDValues.s16.h,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return ProductItem(
                      product: state.productList[index],
                    );
                  },
                ),
              );
            } else if (state is ProductTapFailure) {
              return const CustomErrIcon();
            } else {
              return const CustomCircularIndicator();
            }
          },
        )
      ],
    );
  }
}
