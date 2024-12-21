import 'package:e_commerce_app/config/routes/routes.dart';
import 'package:e_commerce_app/core/api/api_manager.dart';
import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/core/utils/constants_manager.dart';
import 'package:e_commerce_app/core/utils/font_manager.dart';
import 'package:e_commerce_app/core/utils/snackbar_utils.dart';
import 'package:e_commerce_app/core/utils/validator.dart';
import 'package:e_commerce_app/data/dataSources/remoteDataSource/auth_remote_ds_imp.dart';
import 'package:e_commerce_app/data/repo/auth_repo_impl.dart';
import 'package:e_commerce_app/domain/useCases/login_use_case.dart';
import 'package:e_commerce_app/presentation/auth/cubit/auth_cubit.dart';
import 'package:e_commerce_app/presentation/auth/cubit/auth_state.dart';
import 'package:e_commerce_app/presentation/auth/widgets/custom_auth_text_filed.dart';
import 'package:e_commerce_app/presentation/auth/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var viewModel = AuthCubit(
    loginUseCase: LoginUseCase(
      repo: AuthRepoImpl(
        AuthRemoteDsImp(
          ApiManager(),
        ),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccessState) {
            Navigator.pushReplacementNamed(context, Routes.mainLayout);
            SnackBarUtils.showSnackBar(
                context: context, text: Constants.loginSuccessfuly);
          } else if (state is AuthErrState) {
            SnackBarUtils.showSnackBar(context: context, text: state.errMsg);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.primaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: ConstDValues.s16),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Image.asset(
                    ImageAssets.routeLogo,
                    height: MediaQuery.of(context).size.height * .1,
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      Constants.welcomeBackToRoute,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: ConstDValues.s20,
                            fontWeight: FontWeightManager.bold),
                      ),
                    ),
                  ),
                  CustomAuthTextFiled(
                    controller: viewModel.loginEmailController,
                    hintText: Constants.enterYoureEmail,
                    title: Constants.eEmail,
                    validator: Validators.emailV,
                  ),
                  CustomAuthTextFiled(
                    controller: viewModel.loginPasswordController,
                    hintText: Constants.enterYourePassword,
                    title: Constants.pPassword,
                    obscureText: true,
                    validator: Validators.passwordV,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: ConstDValues.s16),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        Constants.forgotPassword,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: ConstDValues.s18,
                              fontWeight: FontWeightManager.normal),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  CustomButton(
                    title: Constants.login,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        viewModel.login();
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
                          Constants.dontHaveAnAccount,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: ConstDValues.s16,
                                fontWeight: FontWeightManager.medium),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.signUp,
                            );
                          },
                          child: Text(
                            Constants.createAccount,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: ConstDValues.s16,
                                  fontWeight: FontWeightManager.medium),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//git push -u origin main
