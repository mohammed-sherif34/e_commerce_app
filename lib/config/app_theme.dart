import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/core/utils/font_manager.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize:  ConstDValues.s12,
        color: AppColors.blackColor,
        fontWeight: FontWeightManager.normal,
      ),
      titleMedium: TextStyle(
        fontSize:  ConstDValues.s14,
        color: AppColors.blackColor,
        fontWeight: FontWeightManager.normal,
      ),
      titleSmall: TextStyle(
        fontSize:  ConstDValues.s14,
        color: AppColors.darkBlue,
        fontWeight: FontWeightManager.medium,
      ),
      bodyLarge: TextStyle(
        fontSize:  ConstDValues.s18,
        color: AppColors.darkBlue,
        fontWeight: FontWeightManager.medium,
      ),
      bodyMedium: TextStyle(
        fontSize: ConstDValues.s20,
        color: AppColors.whiteColor,
        fontWeight: FontWeightManager.medium,
      ),
    ),
  );
}
