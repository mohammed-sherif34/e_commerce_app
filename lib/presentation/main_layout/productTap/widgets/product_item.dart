import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/core/widgets/favourite_icon.dart';
import 'package:e_commerce_app/data/models/product_model.dart';
import 'package:e_commerce_app/presentation/main_layout/productTap/widgets/custom_product_image.dart';
import 'package:e_commerce_app/presentation/main_layout/productTap/widgets/review_rate_widget.dart';
import 'package:e_commerce_app/presentation/productDetails/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ProductDetailsScreen(
                          product: product,
                        )));
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
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                border: Border.all(width: .5, color: Colors.grey),
                borderRadius: BorderRadius.circular(ConstDValues.s15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomProductImage(product: product),
                SizedBox(
                  width: 120.w,
                  child: Text(
                    product.title ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.titleSmall),
                  ),
                ),
                Text(
                  product.description ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.titleSmall),
                ),
                Text(
                  'EGP ${product.price}',
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.titleSmall),
                ),
                ReviewRateWidget(product: product)
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: ConstDValues.s11.h, right: ConstDValues.s17.w),
          child: const FavouriteIcon(),
        ),
      ],
    );
  }
}
