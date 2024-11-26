import 'package:e_commerce_app/presentation/main_layout/favouriteTap/widgets/favourite_item.dart';
import 'package:flutter/material.dart';

class FavouriteTapView extends StatelessWidget {
  const FavouriteTapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return const FavouriteItem();
              }),
        ),
      ],
    );
  }
}
