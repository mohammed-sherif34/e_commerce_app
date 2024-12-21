import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/core/widgets/custom_circular_indicator.dart';
import 'package:e_commerce_app/core/widgets/custom_err_icon.dart';
import 'package:e_commerce_app/data/models/get_and_update_cart_model.dart';
import 'package:e_commerce_app/presentation/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/presentation/productDetails/widgets/change_product_count.dart';
import 'package:e_commerce_app/presentation/productDetails/widgets/rate_count_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCartItem extends StatelessWidget {
  const ProductCartItem({
    super.key,
    required this.product,
    required this.index,
  });
  final Products product;
  final int index;

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
              width: 100.w,
              height: 110.h,
              child: CachedNetworkImage(
                fit: BoxFit.fitWidth,
                imageUrl: product.product!.imageCover ?? '',
                placeholder: (context, url) => const CustomCircularIndicator(),
                errorWidget: (context, url, error) => const CustomErrIcon(),
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
                          product.product!.title ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.bodyLarge),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            CartCubit.get(context).removeCartItem(
                              product.product!.id!,
                            );
                          },
                          icon: const ImageIcon(
                              AssetImage(ImageAssets.deleteIcon))),
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
                                " ${product.price.toString()} EGP",
                                style: GoogleFonts.poppins(
                                    textStyle:
                                        Theme.of(context).textTheme.bodyLarge),
                              ),
                              RateAverageItem(
                                rateAverage: product.product!.ratingsAverage!,
                              ),
                            ],
                          ),
                          ChangeProductCount(
                            product: product,
                            index: index,
                          ),
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
