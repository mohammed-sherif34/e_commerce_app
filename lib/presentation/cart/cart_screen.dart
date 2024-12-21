import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/core/widgets/custom_circular_indicator.dart';
import 'package:e_commerce_app/core/widgets/custom_err_icon.dart';
import 'package:e_commerce_app/presentation/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/presentation/cart/cubit/cart_state.dart';
import 'package:e_commerce_app/presentation/cart/widgets/cart_app_bar.dart';
import 'package:e_commerce_app/presentation/cart/widgets/check_out_button.dart';
import 'package:e_commerce_app/presentation/cart/widgets/product_cart_item.dart';
import 'package:e_commerce_app/presentation/productDetails/widgets/total_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  //CartCubit viewModel=getIt.get<CartCubit>();
  @override
  void initState() {
    // viewModel = CartCubit.get(context);
    CartCubit.get(context).getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cartAppBar(context),
      body: Padding(
        padding: const EdgeInsets.only(
            bottom: ConstDValues.s16,
            left: ConstDValues.s8,
            right: ConstDValues.s8),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<CartCubit, CartState>(
                bloc: CartCubit.get(context),
                builder: (context, state) {
                  if (state is GetCartSuccessState) {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount:
                                  CartCubit.get(context).productsList!.length,
                              itemBuilder: (context, index) {
                                return ProductCartItem(
                                  product: CartCubit.get(context)
                                      .productsList![index],
                                  index: index,
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8, top: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TotalPrice(
                                  totalPrice:
                                      CartCubit.get(context).totalPrice),
                              const CheckOutButton()
                            ],
                          ),
                        )
                      ],
                    );
                  } else if (state is GetCartErrState) {
                    return const CustomErrIcon();
                  }
                  return const CustomCircularIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
