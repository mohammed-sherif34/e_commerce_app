import 'package:e_commerce_app/config/routes/routes.dart';
import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/core/widgets/favourite_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsTapView extends StatelessWidget {
  const ProductsTapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 260.h,
                    mainAxisSpacing: ConstDValues.s16.h,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return ProductItem();
                }),
          )
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.productDetailsScreen);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: ConstDValues.s8),
            padding: EdgeInsets.all(6.h),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                border: Border.all(width: .5, color: Colors.grey),
                borderRadius: BorderRadius.circular(ConstDValues.s15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/product_test2.jpeg',
                  width: 191.w,
                  height: 128.h,
                  fit: BoxFit.cover,
                ),
                Text(
                  'Nike Air Jordon ',
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.titleSmall),
                ),
                Text(
                  'Nike shoes flexible for wo..',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.titleSmall),
                ),
                Text(
                  'EGP 1,200',
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.titleSmall),
                ),
                Row(
                  children: [
                    Text(
                      'Review (4.6)',
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: AppColors.darkBlue)),
                    ),
                    const Icon(
                      Icons.star,
                      color: AppColors.yellow,
                      size: ConstDValues.s15,
                    ),
                    Spacer(),
                    IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Container(
                            height: 30.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Icon(
                              Icons.add,
                              color: AppColors.whiteColor,
                            )))
                  ],
                )
              ],
            ),
          ),
        ),
        FavouriteIcon(),
      ],
    );
  }
}


