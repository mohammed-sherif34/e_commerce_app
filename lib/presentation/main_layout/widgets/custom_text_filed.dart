import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/core/utils/constants_manager.dart';
import 'package:e_commerce_app/core/utils/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(ConstDValues.s16),
        child: SizedBox(
          height: ConstDValues.s50,
          child: TextField(
            decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                gapPadding: 5,
                borderSide: const BorderSide(
                    style: BorderStyle.solid,
                    width: 3,
                    color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(ConstDValues.s24),
              ),
              prefixIcon: const ImageIcon(
                AssetImage(ImageAssets.searchIcon),
                color: AppColors.primaryColor,
              ),
              hintStyle: GoogleFonts.poppins(
                  textStyle: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeightManager.light)),
              hintText: Constants.whatDoYouSearchFor,
              border: OutlineInputBorder(
                gapPadding: 5,
                borderSide:
                    const BorderSide(width: 3, color: AppColors.whiteColor),
                borderRadius: BorderRadius.circular(ConstDValues.s24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
