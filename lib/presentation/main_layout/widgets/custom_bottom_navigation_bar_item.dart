import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

BottomNavigationBarItem customBottomNavigationBarItem({required Widget icon}) {
  return BottomNavigationBarItem(
    icon: icon,
    label: '',
    backgroundColor: AppColors.primaryColor,
    activeIcon: Container(
      decoration:
          const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: icon,
      ),
    ),
  );
}
