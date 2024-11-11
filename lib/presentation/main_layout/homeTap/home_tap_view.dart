import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:e_commerce_app/presentation/main_layout/widgets/cursor_slider.dart';
import 'package:flutter/material.dart';

class HomeTapView extends StatelessWidget {
  const HomeTapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomCursorSlider(),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Categories'),
            Text('view all'),
          ],
        ),
        ConstrainedBox(
          constraints:
              const BoxConstraints(maxHeight: 300, maxWidth: double.infinity),
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(ImageAssets.categorTest),
                  const Text('Women’s\nfashion')
                ],
              );
            },
          ),
        ),
        const Text('Brands'),
      ],
    );
  }
}
//Home Appliance