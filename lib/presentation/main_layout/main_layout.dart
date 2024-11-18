import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:e_commerce_app/core/widgets/cart_icon_button.dart';
import 'package:e_commerce_app/presentation/main_layout/cubit/home_view_model_cubit.dart';
import 'package:e_commerce_app/presentation/main_layout/cubit/home_view_model_state.dart';
import 'package:e_commerce_app/presentation/main_layout/widgets/custom_bottom_navigation_bar.dart';
import 'package:e_commerce_app/presentation/main_layout/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                   const CustomTextFiled(),
                  CartIconButton(),
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
