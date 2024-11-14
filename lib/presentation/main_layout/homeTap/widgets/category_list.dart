import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/config/di/di.dart';
import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/core/utils/snackbar_utils.dart';
import 'package:e_commerce_app/core/widgets/custom_circular_indicator.dart';
import 'package:e_commerce_app/presentation/main_layout/homeTap/cubit/home_tap_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
class CategoysList extends StatefulWidget {
  const CategoysList({
    super.key,
  });

  @override
  State<CategoysList> createState() => _CategoysListState();
}

class _CategoysListState extends State<CategoysList> {
  HomeTapCubit viewModel = getIt<HomeTapCubit>();
  @override
  void initState() {
    viewModel.getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          const BoxConstraints(maxHeight: 300, maxWidth: double.infinity),
      child: BlocConsumer<HomeTapCubit, HomeTapState>(
        listener: (context, state) {
          if (state is BrandsFailure) {
            return SnackBarUtils.showSnackBar(
                context: context, text: state.errMsg, seconds: 3);
          }
        },
        bloc: viewModel,
        builder: (context, state) {
          if (state is CategorisSuccess) {
            return GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categorisList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 100.h,
                      child: CachedNetworkImage(
                          imageBuilder: (context, imageProvider) => Container(
                                width: 100.w,
                                height: 80.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.fill),
                                ),
                              ),
                          fit: BoxFit.cover,
                          imageUrl: state.categorisList[index].image ?? '',
                          placeholder: (context, url) =>  const CustomCircularIndicator(),
                          errorWidget: (context, url, error) =>
                              Image.asset(ImageAssets.categorTest)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(ConstDValues.s8),
                      child: Text(
                        state.categorisList[index].name ?? '',
                        style: GoogleFonts.poppins(
                            textStyle:
                                Theme.of(context).textTheme.titleMedium),
                      ),
                    )
                  ],
                );
              },
            );
          } else if (state is CategorisFailure) {
            return const Center(
              child: Icon(Icons.error_outline),
            );
          } else {
            return  const CustomCircularIndicator();
          }
        },
      ),
    );
  }
}
