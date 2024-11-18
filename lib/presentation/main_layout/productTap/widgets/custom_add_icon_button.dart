import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAddIconButton extends StatelessWidget {
  const CustomAddIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        icon: Container(
            height: 30.h,
            width: 30.w,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: const Icon(
              Icons.add,
              color: AppColors.whiteColor,
            )));
  }
}
