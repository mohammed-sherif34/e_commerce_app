import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/features/main_layout/categoryTap/category_tap_view.dart';
import 'package:e_commerce_app/features/main_layout/favouriteTap/favourite_tap_view.dart';
import 'package:e_commerce_app/features/main_layout/homeTap/home_tap_view.dart';
import 'package:e_commerce_app/features/main_layout/profileTap/profile_tap_view.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> taps = [
    HomeTapView(),
    CategoryTapView(),
    FavouriteTapView(),
    ProfileTapView(),
  ];
  BottomNavigationBarItem customBottom({required Widget icon}) {
    return BottomNavigationBarItem(
      icon: icon,
      label: '',
      backgroundColor: AppColor.primaryColor,
      activeIcon: Container(
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: icon,
        ),
      ),
    );
  }

  int selectedIndex = 0;

  onTapIcon(int value) {
    selectedIndex = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        child: BottomNavigationBar(
            currentIndex: selectedIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColor.primaryColor,
            unselectedItemColor: AppColor.whiteColor,
            onTap: (value) => onTapIcon(value),
            //fixedColor: AppColor.primaryColor,
            backgroundColor: AppColor.primaryColor,
            items: [
              customBottom(
                  icon: const ImageIcon(AssetImage(ImageAssets.homeIcon))),
              customBottom(
                  icon: const ImageIcon(AssetImage(ImageAssets.categoryIcon))),
              customBottom(
                  icon: const ImageIcon(AssetImage(ImageAssets.favouriteIcon))),
              customBottom(
                  icon: const ImageIcon(AssetImage(ImageAssets.profileIcon))),
            ]),
      ),
      body: taps[selectedIndex],
    );
  }
}
