import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/core/widgets/custom_circular_indicator.dart';
import 'package:e_commerce_app/core/widgets/custom_err_icon.dart';
import 'package:e_commerce_app/data/models/get_favourite_model.dart';
import 'package:e_commerce_app/presentation/main_layout/productTap/cubit/product_tap_cubit.dart';
import 'package:e_commerce_app/presentation/productDetails/widgets/rate_count_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteItem extends StatelessWidget {
  const FavouriteItem({
    super.key,
    required this.product,
    required this.viewModel,
  });
  final GetFavouriteData product;
  final ProductTapCubit viewModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 8),
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
              width: 100.w,
              height: 110.h,
              child: CachedNetworkImage(
                imageUrl: product.imageCover ?? '',
                fit: BoxFit.fitWidth,
                placeholder: (context, url) => const CustomCircularIndicator(),
                errorWidget: (context, url, error) => const CustomErrIcon(),
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
                      product.title ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.bodyLarge),
                    ),
                  ),
                  Text(
                    'EGP ${product.price}',
                    style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.bodyLarge),
                  ),
                  RateAverageItem(
                      rateAverage: product.ratingsAverage ?? 0,
                      rateCount: product.ratingsQuantity),
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
              children: [
                Container(
                    //margin: const EdgeInsets.all(16),
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        viewModel.removeProductFromFavourite(
                            productId: product.id);
                      },
                      child: const ImageIcon(
                        color: AppColors.primaryColor,
                        AssetImage(
                          ImageAssets.favouriteActiveIcon,
                        ),
                      ),
                    )),
                AddToCartFavButton(
                  product: product,
                )
              ],
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
    required this.product,
  });
  final GetFavouriteData product;
  @override
  Widget build(BuildContext context) {
    //ProductTapCubit viewModel = getIt.get<ProductTapCubit>();
    return InkWell(
      onTap: () {
        ProductTapCubit.get(context).addProductToCart(productId: product.id);
      },
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
