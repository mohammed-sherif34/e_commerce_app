import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/presentation/cart/widgets/cart_app_bar.dart';
import 'package:e_commerce_app/presentation/cart/widgets/check_out_button.dart';
import 'package:e_commerce_app/presentation/cart/widgets/product_cart_item.dart';
import 'package:e_commerce_app/presentation/productDetails/widgets/total_price.dart';
import 'package:flutter/material.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return ProductCartItem();
                  }),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 8, top: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [TotalPrice(totalPrice: 3500), CheckOutButton()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
