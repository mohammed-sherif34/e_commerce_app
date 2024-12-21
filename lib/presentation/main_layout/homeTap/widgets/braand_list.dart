import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/config/di/di.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/core/utils/snackbar_utils.dart';
import 'package:e_commerce_app/core/widgets/custom_circular_indicator.dart';
import 'package:e_commerce_app/core/widgets/custom_err_icon.dart';
import 'package:e_commerce_app/presentation/main_layout/homeTap/cubit/home_tap_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BrandsList extends StatefulWidget {
  const BrandsList({
    super.key,
  });

  @override
  State<BrandsList> createState() => _BrandsListState();
}

class _BrandsListState extends State<BrandsList> {
  final HomeTapCubit viewModel = getIt<HomeTapCubit>();
  @override
  void initState() {
    viewModel.getAllBrands();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          const BoxConstraints(maxHeight: 300, maxWidth: double.infinity),
      child: BlocConsumer<HomeTapCubit, HomeTapState>(
        listener: (context, state) {
          if (state is HomeTapFailure) {
            return SnackBarUtils.showSnackBar(
                context: context, text: state.errMsg, seconds: 3);
          }
        },
        bloc: viewModel,
        builder: (context, state) {
          if (state is HomeTapSuccess) {
            return GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categorisOrBrandList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 100.h,
                      child: CachedNetworkImage(
                          imageBuilder: (context, imageProvider) => Container(
                                width: 150.w,
                                height: 80.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.fill),
                                ),
                              ),
                          fit: BoxFit.cover,
                          imageUrl: state.categorisOrBrandList[index].image ?? '',
                          placeholder: (context, url) =>
                              const CustomCircularIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(ConstDValues.s8),
                      child: Text(
                        state.categorisOrBrandList[index].name ?? '',
                        style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.titleMedium),
                      ),
                    )
                  ],
                );
              },
            );
          } else if (state is HomeTapFailure) {
            return const CustomErrIcon();
          } else {
            return const CustomCircularIndicator();
          }
        },
      ),
    );
  }
}
