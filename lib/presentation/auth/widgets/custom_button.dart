import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/core/widgets/custom_circular_indicator.dart';
import 'package:e_commerce_app/presentation/auth/cubit/auth_cubit.dart';
import 'package:e_commerce_app/presentation/auth/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.viewModel,
    this.onTap,
    required this.title,
  });

  final AuthCubit viewModel;
  final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: onTap,
            child: Container(
              height: MediaQuery.of(context).size.height * .06,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return state is AuthLoadingState
                        ? const CustomCircularIndicator()
                        : Text(
                            title,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: ConstDValues.s20,
                                  fontWeight: FontWeight.w600),
                            ),
                          );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
