import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 270.w,
        height: 48.h,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(ConstDValues.s20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.values[2],
          children: [
            Padding(
              padding: EdgeInsets.only(right: ConstDValues.s24.w),
              child: const Icon(
                Icons.add_shopping_cart,
                color: AppColors.whiteColor,
              ),
            ),
            Text(
              'Add to cart',
              style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.bodyMedium),
            )
          ],
        ),
      ),
    );
  }
}
