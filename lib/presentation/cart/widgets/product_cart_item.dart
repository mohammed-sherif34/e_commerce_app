import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/presentation/productDetails/widgets/change_product_count.dart';
import 'package:e_commerce_app/presentation/productDetails/widgets/rate_count_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCartItem extends StatelessWidget {
  const ProductCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: ConstDValues.s8, horizontal: 8.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ConstDValues.s25),
        border: Border.all(width: .5, color: Colors.grey.withOpacity(.5)),
        color: AppColors.whiteColor,
      ),
      child: Row(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      IconButton(
                          onPressed: () {},
                          icon: ImageIcon(AssetImage(ImageAssets.deleteIcon))),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 250.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'EGP 3500',
                                style: GoogleFonts.poppins(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge),
                              ),
                              RateCountItem(rateAverage: 4.8, rateCount: 5865),
                            ],
                          ),
                          ChangeProductCount(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
