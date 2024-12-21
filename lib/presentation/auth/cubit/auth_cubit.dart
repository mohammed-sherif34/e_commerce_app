import 'package:e_commerce_app/domain/entity/sign_up_data.dart';
import 'package:e_commerce_app/domain/useCases/login_use_case.dart';
import 'package:e_commerce_app/domain/useCases/sign_up_use_case.dart';
import 'package:e_commerce_app/presentation/auth/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final SignUpUseCase? _signUpUseCase;
  final LoginUseCase? _loginUseCase;
  AuthCubit({SignUpUseCase? signUpUseCase, LoginUseCase? loginUseCase})
      : _loginUseCase = loginUseCase, _signUpUseCase = signUpUseCase, super(AuthInitialState());
  final TextEditingController signupEmailController = TextEditingController();
  final TextEditingController signupPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  signup() async {
    emit(AuthLoadingState());
    var either = await _signUpUseCase!.call(SignUpData(
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

  login() async {
    emit(AuthLoadingState());
    var either = await _loginUseCase!
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
