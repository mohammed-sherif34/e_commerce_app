import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteIcon extends StatefulWidget {
  const FavouriteIcon({
    super.key,
  });

  @override
  State<FavouriteIcon> createState() => _FavouriteIconState();
}

class _FavouriteIconState extends State<FavouriteIcon> {
  bool activeCheck = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 35.h,
      width: 40.w,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          activeCheck = !activeCheck;
          setState(() {});
        },
        child: ImageIcon(
          color: AppColors.primaryColor,
          AssetImage(
            activeCheck
                ? ImageAssets.favouriteActiveIcon
                : ImageAssets.favouriteIcon,
          ),
        ),
      ),
    );
  }
}
