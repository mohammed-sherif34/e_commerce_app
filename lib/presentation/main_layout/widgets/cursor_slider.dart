import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';

class CustomCursorSlider extends StatefulWidget {
  const CustomCursorSlider({super.key});

  @override
  State<CustomCursorSlider> createState() => _CustomCursorSliderState();
}

class _CustomCursorSliderState extends State<CustomCursorSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: [
          Image.asset(ImageAssets.adv_1),
          Image.asset(ImageAssets.adv_2),
          Image.asset(ImageAssets.adv_3)
        ],
        options: CarouselOptions(
          animateToClosest: true,
          height: 190,
          //aspectRatio: 16 / 9,
          //viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: true,
          autoPlay: false,
          autoPlayInterval: const Duration(seconds: 4),
          autoPlayAnimationDuration: const Duration(milliseconds: 1000),
          autoPlayCurve: Curves.slowMiddle,
          enlargeCenterPage: true,
          //enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ));
  }
}
