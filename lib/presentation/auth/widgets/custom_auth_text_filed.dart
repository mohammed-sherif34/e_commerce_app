import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAuthTextFiled extends StatefulWidget {
  const CustomAuthTextFiled({
    super.key,
    required this.hintText,
    required this.title,
    this.validator,
    this.controller,
    this.obscureText = false,
  });
  final String title;
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;

  @override
  State<CustomAuthTextFiled> createState() => _CustomAuthTextFiledState();
}

class _CustomAuthTextFiledState extends State<CustomAuthTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: ConstDValues.s24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: ConstDValues.s18,
                    fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: ConstDValues.s16),
            child: TextFormField(
              //enabled: enabled,
              obscureText: widget.obscureText,
              //enabled: false,
              controller: widget.controller,
              style: const TextStyle(color: Colors.black),
              validator: widget.validator,

              decoration: InputDecoration(
                errorStyle: const TextStyle(
                    color: AppColors.redColor,
                    fontSize: ConstDValues.s12,
                    fontWeight: FontWeight.bold),
                filled: true,
                fillColor: AppColors.whiteColor,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(ConstDValues.s10)),
                hintText: widget.hintText,
                hintStyle: GoogleFonts.inter(
                  textStyle: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: AppColors.grayColor),
                ),
                //hintText: 'enter your task title'
              ),
            ),
          ),
        ],
      ),
    );
  }
}
