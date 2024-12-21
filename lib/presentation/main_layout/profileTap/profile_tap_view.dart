import 'package:e_commerce_app/config/di/di.dart';
import 'package:e_commerce_app/config/routes/routes.dart';
import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/core/utils/shared_prefrence_manager.dart';
import 'package:e_commerce_app/core/utils/validator.dart';
import 'package:e_commerce_app/domain/entity/user_addreese_entity.dart';
import 'package:e_commerce_app/presentation/main_layout/profileTap/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTapView extends StatefulWidget {
  const ProfileTapView({super.key});

  @override
  State<ProfileTapView> createState() => _ProfileTapViewState();
}

class _ProfileTapViewState extends State<ProfileTapView> {
  ProfileCubit viewModel = getIt.get<ProfileCubit>();
  @override
  void initState() {
    viewModel.getAddress();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: ConstDValues.s16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Welcome, ${viewModel.fullNameController.text}',
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.bodyLarge),
                ),
                IconButton(
                  onPressed: () {
                    SharedPreferencesManager.removeData('token');
                    SharedPreferencesManager.removeData('myUser');
                    Navigator.pushReplacementNamed(context, Routes.login);
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40.h),
              child: Text(
                viewModel.emailController.text,
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColors.darkBlue.withOpacity(.6),
                      ),
                ),
              ),
            ),
            const ProfileTextFiledTiltle(
              title: 'Your full name',
            ),
            ProfileTextFiled(
              controller: viewModel.fullNameController,
            ),
            const ProfileTextFiledTiltle(
              title: 'Your E-mail',
            ),
            ProfileTextFiled(
              controller: viewModel.emailController,
            ),
            const ProfileTextFiledTiltle(
              title: 'Your Address',
            ),
            Form(
              key: viewModel.formKey,
              child: ProfileTextFiled(
                controller: viewModel.addressController,
                enabled: true,
                validator: Validators.addresseV,
                onSubmitted: (value) {
                  if (viewModel.formKey.currentState!.validate()) {
                    viewModel.updateAddress(
                        updatedAddress: UserAddreeseEntity(details: value));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTextFiledTiltle extends StatelessWidget {
  const ProfileTextFiledTiltle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          GoogleFonts.poppins(textStyle: Theme.of(context).textTheme.bodyLarge),
    );
  }
}

class ProfileTextFiled extends StatefulWidget {
  ProfileTextFiled(
      {super.key,
      this.obscureText,
      this.enabled = false,
      required this.controller,
      this.validator,
      this.onSubmitted});
  final bool? obscureText;
  final TextEditingController controller;
  bool enabled;
  final void Function(String?)? onSubmitted;
  final String? Function(String?)? validator;
  @override
  State<ProfileTextFiled> createState() => _ProfileTextFiledState();
}

class _ProfileTextFiledState extends State<ProfileTextFiled> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: ConstDValues.s16, bottom: ConstDValues.s24),
      child: SizedBox(
        // height: 54.h,
        width: 398.w,
        child: TextFormField(
          textInputAction: TextInputAction.done,
          validator: widget.validator,
          onFieldSubmitted: widget.onSubmitted,
          enabled: widget.enabled,
          style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.titleSmall),
          obscureText: widget.obscureText ?? false,
          controller: widget.controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColors.primaryColor.withOpacity(.4),
              ),
              borderRadius: BorderRadius.circular(ConstDValues.s15),
            ),
            //contentPadding: EdgeInsets.only(left: 16.w),
            suffixIcon: const ImageIcon(
              AssetImage(ImageAssets.editeIcon),
            ),

            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(width: 1, color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(ConstDValues.s15),
            ),
          ),
        ),
      ),
    );
  }
}
