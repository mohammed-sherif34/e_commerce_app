import 'package:e_commerce_app/features/auth/domain/entity/sign_up_data.dart';
import 'package:e_commerce_app/features/auth/domain/useCases/login_use_case.dart';
import 'package:e_commerce_app/features/auth/domain/useCases/sign_up_use_case.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  SignUpUseCase? signUpUseCase;
  LoginUseCase? loginUseCase;
  AuthCubit({this.signUpUseCase, this.loginUseCase})
      : super(AuthInitialState());
  //signup data and logic handling
  final TextEditingController signupEmailController = TextEditingController();
  final TextEditingController signupPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  signup() async {
    emit(AuthLoadingState());
    var either = await signUpUseCase!.call(SignUpData(
        email: signupEmailController.text,
        password: signupPasswordController.text,
        rePassword: signupPasswordController.text,
        userName: nameController.text,
        phone: phoneController.text));
    either.fold(
      (userModel) => emit(
        AuthSuccessState(userModel),
      ),
      (failure) {
        emit(AuthErrState(failure.errMessage));
      },
    );
  }

  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  login() async {
    emit(AuthLoadingState());
    var either = await loginUseCase!
        .call(loginEmailController.text, loginPasswordController.text);
    either.fold(
      (userModel) => emit(
        AuthSuccessState(userModel),
      ),
      (failure) {
        emit(AuthErrState(failure.errMessage));
      },
    );
  }
}
