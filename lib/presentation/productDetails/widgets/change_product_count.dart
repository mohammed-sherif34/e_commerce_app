import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/data/models/get_and_update_cart_model.dart';
import 'package:e_commerce_app/presentation/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/presentation/cart/cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeProductCount extends StatefulWidget {
  const ChangeProductCount({
    super.key,
    this.product,
    this.index,
  });
  final Products? product;
  final int? index;
  @override
  State<ChangeProductCount> createState() => _ChangeProductCountState();
}

class _ChangeProductCountState extends State<ChangeProductCount> {
  bool enabled = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: 122.w,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(ConstDValues.s20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {
                int itemCount = widget.product!.count!;
                itemCount = itemCount - 1;
                CartCubit.get(context).updateItemQuantity(
                    widget.product!.product!.id!, (itemCount), widget.index!);
              },
              icon: const Icon(
                Icons.remove_circle_outline,
                color: AppColors.whiteColor,
              )),
          BlocBuilder<CartCubit, CartState>(
            bloc: CartCubit.get(context),
            builder: (context, state) {
              if(state is GetCartSuccessState){
                
              }
              return Text(
                '${widget.product!.count}',
                style: GoogleFonts.poppins(
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColors.whiteColor)),
              );
            },
          ),
          IconButton(
            onPressed: () {
              int itemCount = widget.product!.count!;
              itemCount = itemCount + 1;
              CartCubit.get(context).updateItemQuantity(
                  widget.product!.product!.id!, (itemCount), widget.index!);
            },
            icon: const Icon(
              Icons.add_circle_outline,
              color: AppColors.whiteColor,
            ),
          ),
        ],
      ),
    );
  }
}
