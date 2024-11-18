import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SoldCountItem extends StatelessWidget {
  const SoldCountItem({
    super.key,
    required this.soldCount,
  });
  final String soldCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 102.w,
      height: 34.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor.withOpacity(.3)),
        borderRadius: BorderRadius.circular(ConstDValues.s20),
      ),
      child: Center(
        child: Text(
          '$soldCount Sold',
          style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.titleSmall),
        ),
      ),
    );
  }
}
