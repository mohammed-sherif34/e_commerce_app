import 'package:e_commerce_app/config/app_theme.dart';
import 'package:e_commerce_app/config/di/di.dart';
import 'package:e_commerce_app/config/routes/routes.dart';
import 'package:e_commerce_app/config/routes/routes_generator.dart';
import 'package:e_commerce_app/core/utils/api_keys.dart';
import 'package:e_commerce_app/core/utils/shared_prefrence_manager.dart';
import 'package:e_commerce_app/presentation/cart/cubit/cart_cubit.dart';
import 'package:e_commerce_app/presentation/main_layout/productTap/cubit/product_tap_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  Stripe.publishableKey = ApiKeys.publishableKey;
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await SharedPreferencesManager.getInstance();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => getIt.get<ProductTapCubit>(),
      ),
      BlocProvider(
        create: (context) => getIt.get<CartCubit>(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        theme: AppTheme.lightTheme,
        home: child,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesGenerator.onGenerateRoute,
        initialRoute: Routes.splachScreen,
      ),
    );
  }
}
