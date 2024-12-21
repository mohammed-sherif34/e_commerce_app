import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/core/widgets/cart_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar productDetailsAppBar(BuildContext context, String title) {
  return AppBar(
    elevation: 0,
    toolbarHeight: 70.h,
    centerTitle: true,
    iconTheme: const IconThemeData(color: AppColors.primaryColor),
    backgroundColor: AppColors.whiteColor,
    title: Text(
      title,
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
        padding: EdgeInsets.only(left: ConstDValues.s10.w),
        child: const CartIconButton(),
      ),
    ],
  );
}
