import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar cartAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    toolbarHeight: 70.h,
    centerTitle: true,
    iconTheme: const IconThemeData(color: AppColors.primaryColor),
    backgroundColor: AppColors.whiteColor,
    title: Text(
      'Cart',
      style:
          GoogleFonts.poppins(textStyle: Theme.of(context).textTheme.bodyLarge),
    ),
    actions: [
      InkWell(
        onTap: () {},
        child: const ImageIcon(
          AssetImage(ImageAssets.searchIcon),
          color: AppColors.primaryColor,
        ),
      ),
      Padding(
        padding: EdgeInsets.all(ConstDValues.s10.w),
        child: const Icon(
          Icons.shopping_cart_outlined,
          size: ConstDValues.s24,
          color: AppColors.primaryColor,
        ),
      ),
    ],
  );
}
