import 'package:e_commerce_app/config/di/di.dart';
import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/core/utils/constants_manager.dart';
import 'package:e_commerce_app/core/utils/snackbar_utils.dart';
import 'package:e_commerce_app/core/utils/validator.dart';
import 'package:e_commerce_app/presentation/auth/cubit/auth_cubit.dart';
import 'package:e_commerce_app/presentation/auth/cubit/auth_state.dart';
import 'package:e_commerce_app/presentation/auth/widgets/custom_auth_text_filed.dart';
import 'package:e_commerce_app/presentation/auth/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var viewModel = getIt.get<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            SnackBarUtils.showSnackBar(
                context: context, text: Constants.signUpSuccessfuly);
          } else if (state is AuthErrState) {
            SnackBarUtils.showSnackBar(context: context, text: state.errMsg);
          }
        },
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: AppColors.primaryColor,
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: ConstDValues.s16, vertical: ConstDValues.s16),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SafeArea(
                        top: true,
                        child: Image.asset(
                          ImageAssets.routeLogo,
                          height: MediaQuery.of(context).size.height * .1,
                        ),
                      ),
                      CustomAuthTextFiled(
                        controller: viewModel.nameController,
                        hintText: Constants.enterYoureFullName,
                        title: Constants.fullName,
                        validator: Validators.fallNameV,
                      ),
                      CustomAuthTextFiled(
                        controller: viewModel.phoneController,
                        hintText: Constants.enterYourePhone,
                        title: Constants.phone,
                        validator: Validators.phoneNumberV,
                      ),
                      CustomAuthTextFiled(
                        controller: viewModel.signupEmailController,
                        hintText: Constants.enterYoureEmail,
                        title: Constants.eEmail,
                        validator: Validators.emailV,
                      ),
                      CustomAuthTextFiled(
                        controller: viewModel.signupPasswordController,
                        hintText: Constants.enterYourePassword,
                        title: Constants.pPassword,
                        obscureText: true,
                        validator: Validators.passwordV,
                      ),
                      CustomAuthTextFiled(
                        hintText: Constants.enterYoureConfirmPassword,
                        title: Constants.confirmPassword,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "confirm password can not be Empty";
                          }
                          if (value.length < 6) {
                            return "password can not be less Than 6 characters";
                          }
                          if (viewModel.signupPasswordController.text !=
                              value) {
                            return 'confirm password dosn\'t match password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: ConstDValues.s50,
                      ),
                      CustomButton(
                        title: Constants.signup,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            viewModel.signup();
                          }
                        },
                        viewModel: viewModel,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: ConstDValues.s24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Constants.alredayHaveAnAccount,
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: ConstDValues.s16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                Constants.login,
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: AppColors.whiteColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
