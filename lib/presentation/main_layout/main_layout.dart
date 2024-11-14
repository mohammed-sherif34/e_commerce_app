import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/core/utils/constants_manager.dart';
import 'package:e_commerce_app/core/utils/font_manager.dart';
import 'package:e_commerce_app/presentation/main_layout/cubit/home_view_model_cubit.dart';
import 'package:e_commerce_app/presentation/main_layout/cubit/home_view_model_state.dart';
import 'package:e_commerce_app/presentation/main_layout/widgets/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  HomeViewModelCubit viewModel = HomeViewModelCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModelCubit, HomeViewModelState>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: CustomBottomNavigationBar(viewModel: viewModel),
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
                      padding: const EdgeInsets.all(ConstDValues.s16),
                      child: SizedBox(
                        height: ConstDValues.s50,
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: const ImageIcon(
                              AssetImage(ImageAssets.searchIcon),
                              color: AppColors.primaryColor,
                            ),
                            hintStyle: GoogleFonts.poppins(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontWeight: FontWeightManager.light)),
                            hintText: Constants.whatDoYouSearchFor,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(ConstDValues.s24),
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
                      color: AppColors.primaryColor,
                    ),
                  )
                ],
              ),
              Expanded(child: viewModel.taps[viewModel.selectedIndex]),
            ],
          ),
        );
      },
    );
  }
}
