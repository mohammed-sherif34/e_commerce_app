import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/font_manager.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
   
    
   
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 12,
        color: AppColors.blackColor,
        fontWeight: FontWeightManager.normal,
      ),
      titleMedium: TextStyle(
        fontSize: 14,
        color: AppColors.blackColor,
        fontWeight:FontWeightManager.normal,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: AppColors.blackColor,
        fontWeight: FontWeightManager.medium,
      ),
      /*bodyMedium: TextStyle(
        fontSize: 20,
        color: AppColors.darkGray,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontSize: 22,
        color: Colors.lightGray,
        fontWeight: FontWeight.w400,
      ),*/
    ),
  );
}
