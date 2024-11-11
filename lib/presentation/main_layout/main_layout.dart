import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/core/utils/constants_manager.dart';
import 'package:e_commerce_app/presentation/main_layout/categoryTap/category_tap_view.dart';
import 'package:e_commerce_app/presentation/main_layout/favouriteTap/favourite_tap_view.dart';
import 'package:e_commerce_app/presentation/main_layout/homeTap/home_tap_view.dart';
import 'package:e_commerce_app/presentation/main_layout/profileTap/profile_tap_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> taps = [
    const HomeTapView(),
    const CategoryTapView(),
    const FavouriteTapView(),
    const ProfileTapView(),
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
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(ConstDValues.s15),
            topRight: Radius.circular(ConstDValues.s15)),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
              top: true,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(ImageAssets.routeBLogo),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding:
                      // padding: const EdgeInsets.symmetric(horizontal: ConstDValues.s17),
                      const EdgeInsets.all(ConstDValues.s16),
                  child: SizedBox(
                    height: ConstDValues.s50,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const ImageIcon(
                          AssetImage(ImageAssets.searchIcon),
                          color: AppColor.primaryColor,
                        ),
                        hintStyle: GoogleFonts.poppins(
                            textStyle:
                                const TextStyle(fontSize: ConstDValues.s14)),
                        hintText: Constants.whatDoYouSearchFor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(ConstDValues.s24),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                    size: ConstDValues.s24,
                    color: AppColor.primaryColor,
                  ))
            ],
          ),
          Expanded(child: taps[selectedIndex]),
        ],
      ),
    );
  }
}
