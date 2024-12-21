import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({
    super.key,
    required this.totalPrice,
  });
  final num totalPrice;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'total price',
          style: GoogleFonts.poppins(
              textStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.darkBlue.withOpacity(.6))),
        ),
        Text(
          'EGP $totalPrice',
          style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.bodyLarge),
        )
      ],
    );
  }
}
