import 'package:e_commerce_app/config/di/di.dart';
import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/presentation/cart/payment/cubit/payment_cubit.dart';
import 'package:e_commerce_app/presentation/cart/payment/widgets/payment_bottom_sheet_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            builder: (context) {
              return BlocProvider(
                create: (context) =>getIt.get<PaymentCubit>(),
                child: PaymentBottomSheetBody(),
              );
            });
      },
      child: Container(
        width: 270.w,
        height: 48.h,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(ConstDValues.s20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.values[2],
          children: [
            Text(
              'Check out',
              style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.bodyMedium),
            ),
            Padding(
              padding: EdgeInsets.only(left: ConstDValues.s24.w),
              child: const Icon(
                Icons.arrow_right_alt,
                color: AppColors.whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
