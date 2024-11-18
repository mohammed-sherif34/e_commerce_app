import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class DescriptionViwer extends StatelessWidget {
  const DescriptionViwer({
    super.key,
    required this.description,
  });
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.bodyLarge),
        ),
        SizedBox(
          height: 20.h,
        ),
        ReadMoreText(
          description,
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            color: AppColors.darkBlue.withOpacity(.6),
            fontSize: ConstDValues.s18,
          )),
          trimMode: TrimMode.Line,
          trimLines: 3,
          colorClickableText: AppColors.darkBlue,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          moreStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
