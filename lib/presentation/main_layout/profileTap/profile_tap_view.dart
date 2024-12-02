import 'package:e_commerce_app/config/routes/routes.dart';
import 'package:e_commerce_app/core/utils/assets_manager.dart';
import 'package:e_commerce_app/core/utils/color_manager.dart';
import 'package:e_commerce_app/core/utils/constant_double_values.dart';
import 'package:e_commerce_app/core/utils/shared_prefrence_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTapView extends StatelessWidget {
  const ProfileTapView({super.key});
  //User  user = SharedPreferencesManager.getUser('myUser');
  //TextEditingController fullNameController = TextEditingController(text: user.name);
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
                  'Welcome, Mohamed',
                  style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.bodyLarge),
                ),
                IconButton(
                  onPressed: () {
                    SharedPreferencesManager.removeData('token');
                    SharedPreferencesManager.removeData('myUser');
                    Navigator.pushReplacementNamed(context, Routes.login);
                  },
                  icon: Icon(Icons.logout),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 40.h),
              child: Text(
                'mohamed.N@gmail.com',
                style: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColors.darkBlue.withOpacity(.6),
                      ),
                ),
              ),
            ),
            ProfileTextFiledTiltle(
              title: 'Your full name',
            ),
            ProfileTextFiled(),
            ProfileTextFiledTiltle(
              title: 'Your E-mail',
            ),
            ProfileTextFiled(),
            ProfileTextFiledTiltle(
              title: 'Your password',
            ),
            ProfileTextFiled(
              obscureText: true,
            ),
            ProfileTextFiledTiltle(
              title: 'Your mobile number',
            ),
            ProfileTextFiled(),
            ProfileTextFiledTiltle(
              title: 'Your Address',
            ),
            ProfileTextFiled(),
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

class ProfileTextFiled extends StatelessWidget {
  ProfileTextFiled({
    super.key,
    this.obscureText,
  });
  bool? obscureText;

  TextEditingController controller =
      TextEditingController(text: 'Mohamed Mohamed Nabil');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: ConstDValues.s16, bottom: ConstDValues.s24),
      child: SizedBox(
        height: 54.h,
        width: 398.w,
        child: TextField(
          style: GoogleFonts.poppins(
              textStyle: Theme.of(context).textTheme.titleSmall),
          obscureText: obscureText ?? false,
          controller: controller,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: AppColors.primaryColor.withOpacity(.4)),
                  borderRadius: BorderRadius.circular(ConstDValues.s15)),
              contentPadding: EdgeInsets.only(left: 16.w),
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: ImageIcon(AssetImage(ImageAssets.editeIcon))),
              border: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(ConstDValues.s15))),
        ),
      ),
    );
  }
}
