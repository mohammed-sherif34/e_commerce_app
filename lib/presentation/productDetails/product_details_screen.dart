import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/core/widgets/cursor_slider.dart';
import 'package:e_commerce_app/core/widgets/custom_circular_indicator.dart';
import 'package:e_commerce_app/core/widgets/custom_err_icon.dart';
import 'package:e_commerce_app/data/models/product_model.dart';
import 'package:e_commerce_app/presentation/productDetails/widgets/add_to_cart_button.dart';
import 'package:e_commerce_app/presentation/productDetails/widgets/description_viwer.dart';
import 'package:e_commerce_app/presentation/productDetails/widgets/product_details_app_bar.dart';
import 'package:e_commerce_app/presentation/productDetails/widgets/product_title_and_price.dart';
import 'package:e_commerce_app/presentation/productDetails/widgets/rate_count_item.dart';
import 'package:e_commerce_app/presentation/productDetails/widgets/sold_count_item.dart';
import 'package:e_commerce_app/presentation/productDetails/widgets/total_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productDetailsAppBar(context, 'Product Details'),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCursorSlider(
              viewportFraction: .5,
              height: 320.h,
              items: widget.product.images!.map((url) {
                return CachedNetworkImage(
                  imageUrl: url,
                  placeholder: (context, url) =>
                      const CustomCircularIndicator(),
                  errorWidget: (context, url, error) => const CustomErrIcon(),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(ConstDValues.s16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleAndPrice(
                    price: widget.product.price.toString(),
                    title: widget.product.title ?? '',
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SoldCountItem(
                        soldCount: widget.product.sold.toString(),
                      ),
                      RateAverageItem(
                        rateAverage: widget.product.ratingsAverage ?? 0,
                        rateCount: widget.product.ratingsQuantity ?? 0,
                      ),
                      //const ChangeProductCount(),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  DescriptionViwer(
                    description: widget.product.description ?? '',
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TotalPrice(
                        totalPrice: widget.product.price ?? 0,
                      ),
                      const AddToCartButton()
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
