import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/core/utils/constants_manager.dart';
import 'package:e_commerce_app/presentation/main_layout/homeTap/widgets/braand_list.dart';
import 'package:e_commerce_app/presentation/main_layout/homeTap/widgets/category_list.dart';
import 'package:e_commerce_app/core/widgets/cursor_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTapView extends StatelessWidget {
  const HomeTapView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCursorSlider(
            viewportFraction: 1,
            height: 200.h,
            items: [
              Image.asset(ImageAssets.adv_1),
              Image.asset(ImageAssets.adv_2),
              Image.asset(ImageAssets.adv_3)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(ConstDValues.s16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Constants.categories,
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.bodyLarge),
                ),
                Text(
                  Constants.viewAll,
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.titleLarge),
                ),
              ],
            ),
          ),
          const CategoysList(),
          Padding(
            padding: const EdgeInsets.only(
                left: ConstDValues.s16, bottom: ConstDValues.s16),
            child: Text(
              Constants.brands,
              style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.bodyLarge),
            ),
          ),
           const BrandsList(),
        ],
      ),
    );
  }
}
