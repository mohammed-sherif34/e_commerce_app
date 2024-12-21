import 'package:e_commerce_app/core/utils/shared_prefrence_manager.dart';
import 'package:e_commerce_app/data/models/user_model.dart';
import 'package:e_commerce_app/domain/entity/user_addreese_entity.dart';
import 'package:e_commerce_app/domain/useCases/add_user_address_use_case.dart';
import 'package:e_commerce_app/domain/useCases/get_user_address_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'profile_state.dart';

final User user = SharedPreferencesManager.getUser('myUser');

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  static ProfileCubit get(context) => BlocProvider.of(context);
  final GetLoggedUserAddresseUseCase _getLoggedUserAddresseUseCase;
  final AddUserAddressUseCase _addUserAddressUseCase;
  ProfileCubit(this._getLoggedUserAddresseUseCase, this._addUserAddressUseCase)
      : super(ProfileInitial());
  TextEditingController fullNameController =
      TextEditingController(text: user.name);
  TextEditingController emailController =
      TextEditingController(text: user.email);
  TextEditingController addressController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  getAddress() async {
    var either = await _getLoggedUserAddresseUseCase.call();
    either.fold(
        (failure) => emit(
              ProfileErr(errMsg: failure.errMessage),
            ), (response) {
      addressController.text =
          response.data![response.data!.length - 1].details ?? '';
      emit(ProfileGetAddressSuccsesState());
    });
  }

  updateAddress({required UserAddreeseEntity updatedAddress}) async {
    var either = await _addUserAddressUseCase.call(updatedAddress);
    either.fold((failure) {
      emit(
        ProfileErr(errMsg: failure.errMessage),
      );
    }, (response) {
      // addressController.text = response.data![response.data!.length-1].details!;
      emit(ProfileGetAddressSuccsesState());
    });
  }
}
