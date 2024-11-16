import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/presentation/main_layout/productTap/category_tap_view.dart';
import 'package:e_commerce_app/presentation/main_layout/cubit/home_view_model_state.dart';
import 'package:e_commerce_app/presentation/main_layout/favouriteTap/favourite_tap_view.dart';
import 'package:e_commerce_app/presentation/main_layout/homeTap/home_tap_view.dart';
import 'package:e_commerce_app/presentation/main_layout/profileTap/profile_tap_view.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModelCubit extends Cubit<HomeViewModelState> {
  HomeViewModelCubit() : super(HomeViewModelInitial());
  List<Widget> taps = [
    const HomeTapView(),
    const ProductsTapView(),
    const FavouriteTapView(),
    const ProfileTapView(),
  ];

  int selectedIndex = 0;

  onTapIcon(int value) {
    emit(HomeViewModelInitial());
    selectedIndex = value;
    emit(HomeViewModelChangeTap());
  }
}
