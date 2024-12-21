import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCursorSlider extends StatefulWidget {
  const CustomCursorSlider(
      {super.key,
      required this.items,
      required this.height,
      required this.viewportFraction});
  final List<Widget> items;
  final double height;
  final double viewportFraction;
  @override
  State<CustomCursorSlider> createState() => _CustomCursorSliderState();
}

class _CustomCursorSliderState extends State<CustomCursorSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: widget.items,
        options: CarouselOptions(
          //enlargeStrategy: ,
          height: widget.height,
          viewportFraction: widget.viewportFraction,
          initialPage: 0,
          enableInfiniteScroll: true,
          // autoPlay: true,
          autoPlayInterval: const Duration(seconds: 4),
          autoPlayAnimationDuration: const Duration(milliseconds: 1000),
          autoPlayCurve: Curves.slowMiddle,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          pauseAutoPlayOnManualNavigate: true,
        ));
  }
}
