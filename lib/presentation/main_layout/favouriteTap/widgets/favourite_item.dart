import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/core/widgets/favourite_icon.dart';
import 'package:e_commerce_app/presentation/productDetails/widgets/rate_count_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 8),
      margin: EdgeInsets.symmetric(
          vertical: ConstDValues.s8, horizontal: ConstDValues.s16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ConstDValues.s15),
        border: Border.all(width: .5, color: Colors.grey.withOpacity(.5)),
        color: AppColors.whiteColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(ConstDValues.s25),
            clipBehavior: Clip.hardEdge,
            child: SizedBox(
              width: 120.w,
              height: 110.h,
              child: Image.asset(
                'assets/images/product_test4.jpeg',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: ConstDValues.s12),
            child: SizedBox(
              height: 100.h,
              width: 142.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      'Women Shawl',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.bodyLarge),
                    ),
                  ),
                  Text(
                    'EGP 3500',
                    style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.bodyLarge),
                  ),
                  RateCountItem(rateAverage: 4.8, rateCount: 5865),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 90.h,
            width: 100.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [FavouriteIcon(), AddToCartFavButton()],
            ),
          ),
        ],
      ),
    );
  }
}

class AddToCartFavButton extends StatelessWidget {
  const AddToCartFavButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 36.h,
        width: 100.w,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(ConstDValues.s15),
        ),
        child: Center(
          child: Text(
            'Add to cart',
            style: GoogleFonts.poppins(
                textStyle: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: AppColors.whiteColor)),
          ),
        ),
      ),
    );
  }
}
