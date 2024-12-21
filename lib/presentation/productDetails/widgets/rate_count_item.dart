import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RateAverageItem extends StatelessWidget {
  const RateAverageItem({
    super.key,
    required this.rateAverage,
     this.rateCount,
  });
  final num rateAverage;
  final  num? rateCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: AppColors.yellow,
          size: ConstDValues.s15,
        ),
        Text(
          rateCount != null ?'$rateAverage ($rateCount)':'$rateAverage',
          style: GoogleFonts.poppins(
              textStyle: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: AppColors.darkBlue)),
        ),
      ],
    );
  }
}
