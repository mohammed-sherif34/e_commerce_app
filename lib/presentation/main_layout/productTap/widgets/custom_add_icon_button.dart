import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/presentation/main_layout/productTap/cubit/product_tap_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomAddIconButton extends StatefulWidget {
  const CustomAddIconButton({
    super.key,
    required this.productId,
  });
  final String productId;

  @override
  State<CustomAddIconButton> createState() => _CustomAddIconButtonState();
}

class _CustomAddIconButtonState extends State<CustomAddIconButton> {
 // final ProductTapCubit viewModel = getIt.get<ProductTapCubit>();

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          ProductTapCubit.get(context)
              .addProductToCart(productId: widget.productId);
        },
        icon: Container(
          height: 30.h,
          width: 30.w,
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: const Icon(
            Icons.add,
            color: AppColors.whiteColor,
          ),
        ));
  }
}
