import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/presentation/main_layout/cubit/home_view_model_cubit.dart';
import 'package:e_commerce_app/presentation/main_layout/widgets/custom_bottom_navigation_bar_item.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.viewModel,
  });

  final HomeViewModelCubit viewModel;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(ConstDValues.s15),
          topRight: Radius.circular(ConstDValues.s15)),
      child: BottomNavigationBar(
          currentIndex: viewModel.selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.whiteColor,
          onTap: (value) => viewModel.onTapIcon(value),
          //fixedColor: AppColor.primaryColor,
          backgroundColor: AppColors.primaryColor,
          items: [
            customBottomNavigationBarItem(
                icon: const ImageIcon(AssetImage(ImageAssets.homeIcon))),
            customBottomNavigationBarItem(
                icon: const ImageIcon(AssetImage(ImageAssets.categoryIcon))),
            customBottomNavigationBarItem(
                icon: const ImageIcon(AssetImage(ImageAssets.favouriteIcon))),
            customBottomNavigationBarItem(
                icon: const ImageIcon(AssetImage(ImageAssets.profileIcon))),
          ]),
    );
  }
}
