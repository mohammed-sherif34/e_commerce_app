import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/core/utils/constants_manager.dart';
import 'package:e_commerce_app/core/utils/snackbar_utils.dart';
import 'package:e_commerce_app/core/widgets/custom_circular_indicator.dart';
import 'package:e_commerce_app/domain/entity/payment_intent_input_entity.dart';
import 'package:e_commerce_app/presentation/cart/payment/cubit/payment_cubit.dart';
import 'package:e_commerce_app/presentation/cart/payment/cubit/payment_state.dart';
import 'package:e_commerce_app/presentation/cart/payment/widgets/payment_methods_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentBottomSheetBody extends StatefulWidget {
  const PaymentBottomSheetBody({
    super.key,
  });

  @override
  State<PaymentBottomSheetBody> createState() => _PaymentBottomSheetBodyState();
}

class _PaymentBottomSheetBodyState extends State<PaymentBottomSheetBody> {
  bool isPaypal = false;

  updatePaymentMethod({required int index}) {
    if (index == 0) {
      isPaypal = false;
    } else {
      isPaypal = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          PaymentMethodsListView(
            updatePaymentMethod: updatePaymentMethod,
          ),
          const SizedBox(
            height: 32,
          ),
          CustomButtonConsumer(),
          /*CustomButtonBlocConsumer(
            isPaypal: isPaypal,
          ),*/
        ],
      ),
    );
  }
}

class CustomButtonConsumer extends StatelessWidget {
  const CustomButtonConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentErr) {
          SnackBarUtils.showSnackBar(
              context: context, text: state.errMsg, seconds: 3);
          print(state.errMsg);
          Navigator.pop(context);
        }

        if (state is PaymentSuccess) {
          SnackBarUtils.showSnackBar(
              context: context, text: ' Success payment ');
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return CustomPayButton(
          isLoading: state is PaymentLoading ? true : false,
        );
      },
    );
  }
}

class CustomPayButton extends StatelessWidget {
  const CustomPayButton({
    super.key,
    this.isLoading = false,
  });
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<PaymentCubit>(context).makePayment(
            PaymentIntentInputEntitiy(
                amount: '100',
                currency: 'usd',
                customerId: Constants.customerId));
      },
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(ConstDValues.s20),
        ),
        child: isLoading
            ? CustomCircularIndicator()
            : Center(
                child: Text(
                  'Complete',
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.bodyMedium),
                ),
              ),
      ),
    );
  }
}
